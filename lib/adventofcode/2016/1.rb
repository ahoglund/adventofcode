# frozen_string_literal: true

module Adventofcode
  module Year2016
    class Day1 < Adventofcode::Day

      def default_input
        raw_input.split(",").map(&:strip)
      end

      def part_one
        coord = [0,0]
        facing = "N"
        input.each_with_index do |dir, idx|
        direction = dir[0]
        steps = dir[1..-1].to_i
          if idx.even?
            # we are moving X coord
            if direction == "R" && facing == "N"
              coord[0] += steps
              facing = "E"
            elsif direction == "R" && facing == "S"
              coord[0] -= steps
              facing = "W"
            elsif direction == "L" && facing == "N"
              coord[0] -= steps
              facing = "W"
            elsif direction == "L" && facing == "S"
              coord[0] += steps
              facing = "E"
            end
          else
            # we are moving Y coord
            if direction == "R" && facing == "E"
              coord[1] -= steps
              facing = "S"
            elsif direction == "R" && facing == "W"
              coord[1] += steps
              facing = "N"
            elsif direction == "L" && facing == "E"
              coord[1] += steps
              facing = "N"
            elsif direction == "L" && facing == "W"
              coord[1] -= steps
              facing = "S"
            end
          end
        end

        (0 - coord[0]).abs + (0 - coord[1]).abs
      end


      def part_two
      end
    end
  end
end
