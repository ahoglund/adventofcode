# frozen_string_literal: true

require_relative '../manhattan'

module Adventofcode
  module Year2020
    class Day12 < Adventofcode::Day
      def part_one
        coords = Manhattan.new(input).visit3("E")
        ((coords.first.first - coords.last.first) + (coords.first.last - coords.last.last)).abs
      end

      def part_two
      end
    end
  end
end
