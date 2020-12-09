# frozen_string_literal: true

require_relative '../manhattan'

module Adventofcode
  module Year2016
    class Day1 < Adventofcode::Day

      def default_input
        raw_input.split(",").map(&:strip)
      end

      def poles
        ["R", "L"]
      end

      def part_one
        coords = Manhattan.new(input, poles).visit
        ((coords.first.first - coords.last.first) + (coords.first.last - coords.last.last)).abs
      end


      def part_two
        coords = Manhattan.new(input, poles).visit
        seen = []
        coords.each do |coord|
          return ((coords.first.first - coord.first) + (coords.first.last - coord.last)).abs if seen.include?(coord)
          seen << coord
        end
      end
    end
  end
end
