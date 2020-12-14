# frozen_string_literal: true

class Manhattan
  attr_accessor :directions, :all_coords, :facing, :waypoint

  def initialize(directions, initial_facing = "N", waypoint = [0,0])
    @directions = directions
    @all_coords = []
    @facing     = initial_facing
    @waypoint_x = waypoint[0]
    @waypoint_y = waypoint[1]
    @waypoint   = waypoint
  end

  DIRECTIONS = %w(N E S W).freeze

  def move(steps, x_coord, y_coord)
    if @facing == "N"
      steps.to_i.times.each do
        y_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "E"
      steps.to_i.times.each do
        x_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "S"
      steps.to_i.times.each do
        y_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "W"
      steps.to_i.times.each do
        x_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    end

    [x_coord, y_coord]
  end

  def rotate(direction, degrees)
    if direction == "L"
      if degrees == "90"
        @facing = DIRECTIONS[DIRECTIONS.index(@facing) - 1]
      elsif degrees == "180"
        @facing = DIRECTIONS[DIRECTIONS.index(@facing) - 2]
      elsif degrees == "270"
        @facing = DIRECTIONS[DIRECTIONS.index(@facing) - 3]
      end
    elsif direction == "R"
      if degrees == "90"
        @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 1)) % DIRECTIONS.length]
      elsif degrees == "180"
        @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 2)) % DIRECTIONS.length]
      elsif degrees == "270"
        @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 3)) % DIRECTIONS.length]
      end
    end
  end

  def visit4
    x_coord = 0
    y_coord = 0
    all_coords << [x_coord, y_coord]
    directions.each do |x|
      command = x[0]
      sub_command = x[1..-1]
      if command == "F"
        binding.pry
        x_coord, y_coord = move(sub_command, x_coord * @waypoint_x, y_coord * @waypoint_y)
        @waypoint = [x_coord + @waypoint_x, y_coord + @waypoint_y]
      elsif DIRECTIONS.include?(command)
        prev_facing = @facing
        @facing = command
        x_coord, y_coord = move(sub_command, x_coord, y_coord)
        @facing = prev_facing
      elsif %w(L R).include?(command)
        rotate(command, sub_command)
      end
    end

    all_coords
  end


  def visit3
    x_coord = 0
    y_coord = 0
    all_coords << [x_coord, y_coord]
    directions.each do |x|
      command = x[0]
      sub_command = x[1..-1]
      if command == "F"
        x_coord, y_coord = move(sub_command, x_coord, y_coord)
      elsif DIRECTIONS.include?(command)
        prev_facing = @facing
        @facing = command
        x_coord, y_coord = move(sub_command, x_coord, y_coord)
        @facing = prev_facing
      elsif %w(L R).include?(command)
        rotate(command, sub_command)
      end
    end

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

  def visit2(poles)
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
