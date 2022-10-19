# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day7 < Adventofcode::Day
      def default_input
        raw_input.split("\n")
      end

      def part_one
        instructions = {}
        input.each do |line|
          parts = line.split(" -> ")
          instructions[parts.last] = parts.first.split(" ")
        end

        process("a", instructions)
      end

      def process(ident, instructions)
        inst = instructions[ident]

        return ident.to_i if ident =~ /\d+/
        return inst.to_i if inst =~ /\d+/
        return inst.to_i if inst.is_a?(Fixnum)

        binding.pry if inst.nil?
        if inst[0] == "NOT"
          instructions[ident] = 15.downto(0).map { |n| (~process(inst.last, instructions).to_i)[n] }.join.to_i(2)
        elsif inst[1] == "AND"
          instructions[ident] = process(inst.first, instructions) & process(inst.last, instructions)
        elsif inst[1] == "OR"
          instructions[ident] = process(inst.first, instructions) | process(inst.last, instructions)
        elsif inst[1] == "LSHIFT"
          instructions[ident] = process(inst.first, instructions) << inst.last.to_i
        elsif inst[1] == "RSHIFT"
          instructions[ident] = process(inst.first, instructions) >> inst.last.to_i
        else
          instructions[ident] = process(inst.first, instructions)
        end
      end

      def part_two
        instructions = {}

        input.each do |line|
          parts = line.split(" -> ")
          instructions[parts.last] = parts.first.split(" ")
        end

        instructions["b"] = ["3176"]

        process("a", instructions)
      end
    end
  end
end
