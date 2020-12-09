# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day8 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        parse_prog(input)
      end

      def parse_prog(prog_ins, early_return = true)
        infinite_loop_preventer = 0
        global_acc           = 0
        index                = 0
        visited_instructions = Set.new

        while !prog_ins[index].nil? && infinite_loop_preventer < 1000
          infinite_loop_preventer += 1
          if visited_instructions.include?(index) && early_return
            return global_acc
          end

          visited_instructions.add(index)

          ins = prog_ins[index].split(" ")
          if ins[0] == 'nop'
            index += 1
          elsif ins[0] == 'acc'
            global_acc +=  ins[1].to_i
            index += 1
          elsif ins[0] == 'jmp'
            index += ins[1].to_i
          end
        end

         infinite_loop_preventer < 1000 ? global_acc : 0
      end

      def part_two
        (0..input.length - 1).each do |no|
          input_copy = input.dup
          ins = input_copy[no].split(" ")

          if ins[0] == 'nop'
            #change this to a jmp
            input_copy[no] = 'jmp ' + ins[1]
          elsif ins[0] == 'jmp'
            #change this to a nop
            input_copy[no] = 'nop ' + ins[1]
          else
            #noop, its an acc
          end

          r = parse_prog(input_copy, false)
          return r if r > 0
        end
      end
    end
  end
end
