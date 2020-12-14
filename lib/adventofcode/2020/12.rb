# frozen_string_literal: true

require_relative '../manhattan'

module Adventofcode
  module Year2020
    class Day12 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end
      def part_one
        coords = Manhattan.new(input, "E").visit3
        coords.last.first.abs + coords.last.last.abs
      end

      def part_two
        coords = Manhattan.new(input, "E", [10,1]).visit4
        coords.last.first.abs + coords.last.last.abs
      end
    end
  end
end
