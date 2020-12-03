# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day3 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def map
        input.each_with_object([]) do |line, map|
          map << line * input.length
        end
      end

      def part_one
        checks = [[3,1]]

        calc(checks)
      end

      def part_two
        checks = [
          [1,1],
          [3,1],
          [5,1],
          [7,1],
          [1,2],
        ]
        calc(checks)
      end

      def calc(checks)
        tree_totals = []
        checks.each do |check|
          pos  = 0
          hit_trees = 0
          (check[1]..(map.length - 1)).step(check[1]) do |index|
            pos += check[0]
            if map[index][pos] == "#"
              hit_trees += 1
            end
          end
          tree_totals << hit_trees
        end

        tree_totals
      end
    end
  end
end
