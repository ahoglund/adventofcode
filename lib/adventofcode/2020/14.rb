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

      def apply_mask_v2(mask, value)
        mask_to_one = mask.tr("X", "0")
        mask_to_zero = mask.tr("X", "1")
        (mask_to_one.to_i(2) | value) | mask_to_zero.to_i(2)
      end

      def reapply_floating(mask, masked_mem_address)
        x_indexes(mask).reduce(("%036b" % masked_mem_address).split("")) { |m, i| m[i] = 'X'; m }.join
      end

      def x_indexes(d)
        @x_indexes ||= {}

        return @x_indexes[d] if @x_indexes[d]

        @x_indexes[d] ||= []

        d.split("").each_with_index { |b,i| @x_indexes[d] << i if b == 'X' }

        @x_indexes[d]
      end

      def generate_all_mem_address_from(addr)
        floating = [addr]

        addr.count("X").times do
          floating = floating.flat_map { |x| [x.sub("X", "0"), x.sub("X", "1")] }
        end

        floating
      end

      def part_two
        mask = input.shift.split(" = ")[1]
        memory = {}
        input.each do |line|
          if line =~ /^mask/
            mask = line.split(" = ")[1]
            next
          end
          split_line = line.split(" = ")

          mem_address        = split_line[0].match(/\[(\d+)\]()/)[1].to_i
          value              = split_line[1].to_i
          masked_mem_address = apply_mask_v2(mask, mem_address)
          ma_with_floats     = reapply_floating(mask, masked_mem_address)
          mem_addrs          = generate_all_mem_address_from(ma_with_floats)

          mem_addrs.each do |mem_addr|
            memory[mem_addr.to_i(2)] = value
          end
        end

        memory.values.sum
      end
    end
  end
end
