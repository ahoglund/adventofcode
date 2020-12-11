# frozen_string_literal: true

module Adventofcode
  module Year2017
    class Day1 < Adventofcode::Day
      def part_one
        shrink = input.first
        sum = 0

        while shrink > 0
          if shrink % 10 == (shrink / 10) % 10
            sum += (shrink % 10)
          end

          shrink = (shrink / 100)
        end

        sum
      end

      def part_two
      end
    end
  end
end
