# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day3 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        slopes = [[3,1]]
        calculate(slopes)
      end

      def part_two
        slopes = [
          [1,1],
          [3,1],
          [5,1],
          [7,1],
          [1,2],
        ]
        calculate(slopes)
      end

      def calculate(slopes)
        slopes.map do |check|
          pos       = 0
          hit_trees = 0
          (check[1]..(input.length - 1)).step(check[1]) do |index|
            pos = (pos + check[0]) % input[index].length
            hit_trees += 1 if input[index][pos] == "#"
          end
          hit_trees
        end.reduce(&:*)
      end
    end
  end
end
