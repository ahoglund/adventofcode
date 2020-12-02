require_relative "intcode_computer"

program = File.read("../inputs/5.txt").strip.split(",").map(&:to_i)

IntcodeComputer.new(program, 5).compute
