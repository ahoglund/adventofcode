# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day14 < Adventofcode::Day
      def default_input
        raw_input.split("\n")
      end

      def part_one
        mask = input.shift.split(" = ")[1]
        memory = {}
        input.each do |line|
          if line =~ /^mask/
            mask = line.split(" = ")[1]
            next
          end
          split_line = line.split(" = ")
          mem_address = split_line[0].match(/\[(\d+)\]()/)[1]
          value = split_line[1].to_i
          memory[mem_address] = apply_mask(mask, value)
        end

        memory.values.sum
      end

      def apply_mask(mask, value)
        mask_to_one = mask.tr("X", "0")
        mask_to_zero = mask.tr("X", "1")
        (mask_to_one.to_i(2) | value) & mask_to_zero.to_i(2)
      end

      def part_two
      end
    end
  end
end
