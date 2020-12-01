day = __FILE__.split(".").first
input = File.read("../inputs/#{day}.txt").split("")

# 1

floor = 0
input.each do |i|
  if i == "("
    floor += 1
  elsif i == ")"
    floor -= 1
  end
end

#puts floor

# 2
floor = 0
input.each_with_index do |paren, idx|
  if paren == "("
    floor += 1
  elsif paren == ")"
    floor -= 1
  end

  if floor < 0
    puts idx + 1
    return
  end
end
