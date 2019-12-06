input = File.read("3.txt").split("\n").map { |i| i.split(",") }

def get_coords(directions)
  coords = Hash.new
  x_pos = 0
  y_pos = 0
  c     = 0
  directions.each do |x|
    a = x.split('')
    direction = a.shift
    a.join.to_i.times.each do
      c += 1
      if direction == "R"
        x_pos += 1
      elsif direction == "U"
        y_pos += 1
      elsif direction == "L"
        x_pos -= 1
      elsif direction == "D"
        y_pos -= 1
      end
      coords[[x_pos, y_pos]] ||= c
    end
  end

  coords
end

wire_1_coords = get_coords(input.first)
wire_2_coords = get_coords(input.last)
matches = (wire_1_coords.keys & wire_2_coords.keys)

# manhattan dist
# part 1
puts matches.map { |x, y| x.abs + y.abs }.min

# part 2
puts matches.map { |k| wire_1_coords[k] + wire_2_coords[k] }.min
