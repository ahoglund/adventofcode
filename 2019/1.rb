input = File.read("1.txt").split("\n").map(&:to_i)

# 1
puts input.map { |i| ( i / 3 ) - 2 }.sum

# 2
#
def calc_fuel(mass)
  ( mass / 3 ) - 2
end


total_fuel = 0
input.map do |i|
  x = calc_fuel(i)
  while x > 0
    total_fuel += x
    x = calc_fuel(x)
  end

  total_fuel
end

puts total_fuel
