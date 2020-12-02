# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day1 < Adventofcode::Day
      def part_one
        input.combination(2) do |comb|
          int_arr = comb.map(&:to_i)
          return int_arr[0] * int_arr[1] if int_arr.sum == 2020
        end
      end

      def part_two
        input.combination(3) do |comb|
          int_arr = comb.map(&:to_i)
          return int_arr[0] * int_arr[1] * int_arr[2] if int_arr.sum == 2020
        end
      end
    end
  end
end
