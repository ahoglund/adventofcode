# frozen_string_literal: true

class Manhattan
  attr_accessor :directions, :poles, :all_coords

  def initialize(directions, poles)
    @directions = directions
    @poles      = poles
    @all_coords = []
  end

  def visited_coords
    c       = 0
    x_coord = 0
    y_coord = 0
    directions.each do |x|
      direction = x[0]
      steps = x[1..-1]
      steps.to_i.times.each do
        c += 1
        if direction == poles[0]
          x_coord += 1
        elsif direction == poles[1]
          y_coord += 1
        elsif direction == poles[2]
          x_coord -= 1
        elsif direction == poles[3]
          y_coord -= 1
        end

        all_coords << Coord.new(x_coord, y_coord, c)
      end
    end

    all_coords
  end

  class Coord
    attr_reader :value, :visited
    def initialize(x, y, visited)
      @value   = [x, y]
      @visited = visited
    end
  end
end
