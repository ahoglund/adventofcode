lines = input.lines.map(&:chomp)
mem1 = Hash.new(0)
mem2 = Hash.new(0)
maskand = nil
maskset = nil
maskfloat = nil
lines.each do |line|
  if line =~ /\Amask = (.*)\z/
    mask = $1
    maskand = mask.tr("01X", "001").to_i(2)
    maskset = mask.tr("01X", "010").to_i(2)
    floating = [mask.tr("01", "00")]
    mask.count("X").times do
      floating = floating.flat_map { |x| [x.sub("X", "0"), x.sub("X", "1")] }
    end
    maskfloat = floating.map{|x| x.to_i(2) }
  elsif line =~ /\Amem\[(\d+)\] = (\d+)\z/
    addr = $1.to_i
    val = $2.to_i
    mem1[addr] = (val & maskand) | maskset
    maskfloat.each do |float|
      mem2[(addr | maskset) ^ float] = val
    end
  end
end
[
  mem1.values.sum,
  mem2.values.sum
]
