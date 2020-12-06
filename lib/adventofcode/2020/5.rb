# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day5 < Adventofcode::Day
      def default_input
        raw_input.split("\n")#.map { |i| i.split("") }
      end

      def binary_search(low, high, input)
        return high if input.empty?
        next_dir = input.shift
        if %w(F L).include?(next_dir)
          middle = (low + high) / 2
          binary_search(low, middle, input)
        elsif %w(B R).include?(next_dir)
          middle = ((low + high) / 2) + 1
          binary_search(middle, high, input)
        end
      end

      def seat_ids
        input.map do |boarding_pass|
          # its just binary :mindblown:
          boarding_pass.tr("LRFB", "0101").to_i(2)
          # row = binary_search(0, 127, boarding_pass[0..6])
          # seat = binary_search(0, 7, boarding_pass[7..-1])
          # (row * 8) + seat
        end.sort
      end

      def part_one
        seat_ids.last
      end

      def part_two
        ((seat_ids[0]..seat_ids[-1]).to_a - seat_ids).first
      end
    end
  end
end
