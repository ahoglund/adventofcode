# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day1 < Adventofcode::Day

      def default_input
        raw_input.split("")
      end

      def part_one
        floor = 0
        input.each do |i|
          if i == "("
            floor += 1
          elsif i == ")"
            floor -= 1
          end
        end

        floor
      end

      def part_two
        floor = 0
        input.each_with_index do |paren, idx|
          if paren == "("
            floor += 1
          elsif paren == ")"
            floor -= 1
          end

          if floor < 0
            return idx + 1
          end
        end
      end
    end
  end
end
