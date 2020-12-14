# frozen_string_literal: true

class Manhattan
  attr_accessor :directions, :poles, :all_coords

  def initialize(directions, poles = [])
    @directions = directions
    @poles      = poles
    @all_coords = []
  end

  DIRECTIONS = %w(N E S W).freeze

  def move(facing, steps, x_coord, y_coord)
    if facing == "N"
      steps.to_i.times.each do
        y_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif facing == "E"
      steps.to_i.times.each do
        x_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif facing == "S"
      steps.to_i.times.each do
        y_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    elsif facing == "W"
      steps.to_i.times.each do
        x_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    end

    all_coords
  end

  def visit3(initial_facing = "N")
    facing  = initial_facing
    x_coord = 0
    y_coord = 0
    all_coords << [x_coord, y_coord]
    directions.each do |x|
      command = x[0]
      sub_command = x[1..-1]
      if command == "F"
        move(facing, sub_command, x_coord, y_coord)
      elsif DIRECTIONS.include?(command)
        # MORE THIS DIRECTIONS
        move(command, sub_command, x_coord, y_coord)
      elsif %w(L R).include?(command)
        if command == "L"
          if sub_command == "90"
            new_direction =  DIRECTIONS[DIRECTIONS.index(facing) - 1]
          elsif sub_command == "180"
            new_direction = DIRECTIONS[DIRECTIONS.index(facing) - 2]
          elsif sub_command == "270"
            new_direction = DIRECTIONS[DIRECTIONS.index(facing) - 3]
          end
        elsif command == "R"
          if sub_command == "90"
            new_direction = DIRECTIONS[DIRECTIONS.index(facing) + 1]
          elsif sub_command == "180"
            new_direction = DIRECTIONS[DIRECTIONS.index(facing) + 2]
          elsif sub_command == "270"
            new_direction = DIRECTIONS[DIRECTIONS.index(facing) + 3]
          end
        end
        facing = new_direction
      end
    end

    binding.pry

    all_coords
  end


  def visit(initial_facing = "N")
    facing  = initial_facing
    x_coord = 0
    y_coord = 0
    all_coords << [x_coord, y_coord]
    directions.each do |x|
      direction = x[0]
      steps = x[1..-1]
      if direction == "R" && facing == "N"
        facing = "E"
        steps.to_i.times.each do
          x_coord += 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "R" && facing == "E"
        facing = "S"
        steps.to_i.times.each do
          y_coord -= 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "R" && facing == "S"
        facing = "W"
        steps.to_i.times.each do
          x_coord -= 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "R" && facing == "W"
        facing = "N"
        steps.to_i.times.each do
          y_coord += 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "L" && facing == "N"
        facing = "W"
        steps.to_i.times.each do
          x_coord -= 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "L" && facing == "W"
        facing = "S"
        steps.to_i.times.each do
          y_coord -= 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "L" && facing == "S"
        facing = "E"
        steps.to_i.times.each do
          x_coord += 1
          all_coords << [x_coord, y_coord]
        end
      elsif direction == "L" && facing == "E"
        facing = "N"
        steps.to_i.times.each do
          y_coord += 1
          all_coords << [x_coord, y_coord]
        end
      end
    end

    all_coords
  end

  def visit2
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
