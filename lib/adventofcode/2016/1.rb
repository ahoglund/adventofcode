# frozen_string_literal: true

require_relative '../manhattan'

module Adventofcode
  module Year2016
    class Day1 < Adventofcode::Day

      def default_input
        raw_input.split(",").map(&:strip)
      end

      def poles
        ["R", "U", "L", "D"]
      end

      def part_one
        coords = Manhattan.new(input, poles).visited_coords.last
        binding.pry
        coords.map { |x, y| x.abs + y.abs }.min
      end


      def part_two
      end
    end
  end
end
