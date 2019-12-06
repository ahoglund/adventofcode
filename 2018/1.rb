nums = File.readlines('1.input').map(&:to_i)

# PART ONE
puts nums.reduce(0) { |i,start| start + i } == 522
puts nums.sum == 522

# PART TWO
require 'set'
set = Set.new
result = 0
dup = false

while(dup == false) do
  nums.each do |num|
    result += num
    unless set.add?(result)
      puts result == 73364
      dup = true
      break
    end
  end
end

# OR MORE TERSE
set = Set.new
result = 0
nums.cycle do |num|
  result += num
  unless set.add?(result)
    puts result == 73364
    break
  end
end

