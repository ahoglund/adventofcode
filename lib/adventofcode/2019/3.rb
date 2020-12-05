# frozen_string_literal: true

require_relative '../manhattan'

module Adventofcode
  module Year2019
    class Day3 < Adventofcode::Day
      def default_input
        raw_input.split("\n").map { |i| i.split(",") }
      end

      def poles
        ["R", "U", "L", "D"]
      end

      def wire_1_coords
        @wire_1_coords ||= Manhattan.new(input.first, poles).visited_coords
      end

      def wire_2_coords
        @wire_2_coords ||= Manhattan.new(input.last, poles).visited_coords
      end

      def part_one
        matches = (wire_1_coords.map(&:value) & wire_2_coords.map(&:value))
        matches.map { |x, y| x.abs + y.abs }.min
      end

      def part_two
        matches = (wire_1_coords.map(&:value) & wire_2_coords.map(&:value))
        (wire_1_coords + wire_2_coords).each_with_object(Hash.new(0)) do |coord, h|
          next unless matches.include?(coord.value)
          h[coord.value] += coord.visited
        end.values.min
      end
    end
  end
end
