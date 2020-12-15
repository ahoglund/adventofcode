# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day13 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        minutes = input[0].to_i
        bus_ids = input[1].split(",").filter {|b| b!="x"}.map(&:to_i)

        closest = bus_ids.first
        difference = 0
        bus_ids.map do |bus_id|
          if (((minutes / bus_id) + 1) * bus_id) < (((minutes / closest) + 1) * closest)
            difference = (((minutes / bus_id) + 1) * bus_id) - minutes
            closest = bus_id
          end
        end

        closest * difference
      end

      def part_two
      end
    end
  end
end
