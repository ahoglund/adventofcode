# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day9 < Adventofcode::Day
      def part_one(preamble_length = 25)
        preamble_numbers = input[0..(preamble_length - 1)]

        input[preamble_length..-1].each do |no|
          found = false
          preamble_numbers.permutation(2) do |p|
            found = true if p.sum == no
          end

          return no unless found

          preamble_numbers.shift
          preamble_numbers << no
        end
      end

      def part_two
        number = part_one
        total  = 0
        i      = 0
        x      = 0

        while x < input.length do
          while i < input.length do
            total = input[x..i].sum
            return (input[x..i].max + input[x..i].min) if total == number
            i += 1
          end
          x += 1
          i = x
        end
      end
    end
  end
end
