class Advent
  def data
    DATA.each_line.map(&:chomp).dup
  end

  def part_one
    data
  end

  def part_two
  end
end

if $0 == __FILE__
  advent = Advent.new
  puts advent.part_one.inspect
  # puts advent.part_two
end

__END__
asdf
