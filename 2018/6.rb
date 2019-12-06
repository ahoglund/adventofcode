input = File.readlines("6.input").map(&:chomp)

input=<<-INPUT
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
INPUT
input = input.split("\n")

def print_fl(str)
  print str
  $stdout.flush
end

input.map! { |line| line.split(',').map(&:to_i) }.flatten

canvas_width  = input.max_by { |i| i[0] }[0]
canvas_height = input.max_by { |i| i[1] }[1]

map = []

# setup canva
(0..(canvas_width + 1)).each do |i|
  (0..(canvas_height + 1)).each do |x|
    map[x] ||= []
    map[x][i] = "X"
  end
end
# plot coords
input.each_with_index do |coords, i|
  map[coords[1]][coords[0]] = i
end


def on_a_coord?(spot, coord)
  spot == coord
end

def taxi_dist(spot, coord)
  ((spot[0] - coord[0]) + (spot[1] - coord[1])).abs
end

max_distance = taxi_dist([0,0], [canvas_width, canvas_height])

# calculate territory
map.each_with_index do |row, row_i|
  row.each_with_index do |_, cell_i|
    shortest = max_distance
    input.each_with_index do |coords, i|
      if on_a_coord?([cell_i, row_i], coords)
        map[row_i][cell_i] = "C#{i}"
        break
      end
      distance = taxi_dist([cell_i, row_i], coords)
      # if distance == shortest
      #   map[row_i][cell_i] = "XX"
      if distance < shortest
        shortest = distance
        map[row_i][cell_i] = "N#{i}"
      end
    end
  end
end

map.each do |r|
  print_fl "#{r.inspect} "
  r.each do |c|
  end
  print_fl "\n"
end
