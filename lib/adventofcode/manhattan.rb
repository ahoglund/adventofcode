# frozen_string_literal: true

class Manhattan
  attr_accessor :directions, :all_coords, :facing, :waypoint

  def initialize(directions, initial_facing = "N", waypoints = ["N0", "N0"])
    @directions = directions
    @all_coords = []
    @facing     = initial_facing
    @waypoints  = parse_waypoints(waypoints)
  end

  DIRECTIONS = %w(N E S W).freeze

  def move(steps, x_coord, y_coord)
    if @facing == "N"
      steps.times.each do
        y_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "E"
      steps.times.each do
        x_coord += 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "S"
      steps.times.each do
        y_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    elsif @facing == "W"
      steps.times.each do
        x_coord -= 1
        all_coords << [x_coord, y_coord]
      end
    end

    [x_coord, y_coord]
  end

  def rotate(direction, degrees)
    if direction == "L"
      if degrees == "90"
        face(DIRECTIONS[DIRECTIONS.index(@facing) - 1])
      elsif degrees == "180"
        face(DIRECTIONS[DIRECTIONS.index(@facing) - 2])
      elsif degrees == "270"
        face(DIRECTIONS[DIRECTIONS.index(@facing) - 3])
      end
    elsif direction == "R"
      if degrees == "90"
        face(DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 1)) % DIRECTIONS.length])
      elsif degrees == "180"
        face(DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 2)) % DIRECTIONS.length])
      elsif degrees == "270"
        face(DIRECTIONS[(DIRECTIONS.index(@facing) + (DIRECTIONS.length + 3)) % DIRECTIONS.length])
      end
    end
  end

  class Waypoint
    attr_reader :direction, :steps
    def initialize(direction, steps)
      @direction, @steps = direction, steps
    end
  end

  def parse_waypoints(raw_waypoints)
    raw_waypoints.map do |waypoint|
      Waypoint.new(waypoint[0], waypoint[1..-1].to_i)
    end
  end

  def face(direction)
    @facing = direction
  end

  def visit4
    x_coord = 0
    y_coord = 0
    all_coords << [x_coord, y_coord]
    directions.each do |x|
      command = x[0]
      sub_command = x[1..-1].to_i
      if command == "F"
        sub_command.times do
          @waypoints.each do |waypoint|
            x_coord, y_coord = move(waypoint.steps, x_coord, y_coord)
          end
        end
        binding.pry
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
