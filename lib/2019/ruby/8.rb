#day = __FILE__.split(".").first
#input = File.read("../inputs/#{day}.txt").split("\n").map(&:to_i)
image_width = 3
layers = 2

input = 123456789012
rem = input % 10
base = input / 10

layers.times do |layer|
  image_width.times do |pixel|
    rem = base % 10
    base = base / 10
  end
end

# 1

# 2
