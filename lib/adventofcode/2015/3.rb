# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day3 < Adventofcode::Day
      def part_one
        seen = Set.new
        coord = [0, 0]
        seen.add(coord)
        raw_input.split("").each do |dir|
          coord = next_coord(dir, coord)
          seen.add(coord)
        end
        seen.count
      end

      def part_two
        seen        = Set.new
        santa_coord = [0, 0]
        robo_coord  = [0, 0]
        raw_input.split("").each_with_index do |dir, i|
          if real_santa?(i)
            santa_coord = next_coord(dir, santa_coord)
            seen.add(santa_coord)
          else
            robo_coord = next_coord(dir, robo_coord)
            seen.add(robo_coord)
          end
        end

        seen.count
      end

      def real_santa?(i)
        i % 2 == 0
      end

      def next_coord(dir, coord)
        case dir
        when "<"
          [coord[0] - 1, coord[1]]
        when ">"
          [coord[0] + 1, coord[1]]
        when "^"
          [coord[0], coord[1] + 1]
        when "v"
          [coord[0], coord[1] - 1]
        else
          raise "bad dir"
        end
      end
    end
  end
end
