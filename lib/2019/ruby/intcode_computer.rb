# OPCODE 1: if your Intcode computer encounters 1,10,20,30, it should read the
# values at positions 10 and 20, add those values, and then overwrite the
# value at position 30 with their sum.
# OPCODE 2: Same, but mutiply
# OPCODE 3 takes a single integer as input and saves it to the address given by
# its only parameter. For example, the instruction 3,50 would take an input value
# and store it at address 50.
require 'pry'

class IntcodeComputer
  attr_reader :program, :inputs, :output

  def initialize(program, inputs)
    @program = program
    @inputs = Array(inputs)
    @output = []
  end

  def add_input(input)
    @inputs << input
  end

  def compute
    pointer_address = 0
    until program[pointer_address] == 99 do
      opcode = program[pointer_address] % 100
      parameter_mode = program[pointer_address] / 100

      case opcode
      when 1
        sum = get_value(pointer_address, 1, parameter_mode) + get_value(pointer_address, 2, parameter_mode)
        program[program[pointer_address + 3]] = sum
        pointer_address += 4
      when 2
        prod = get_value(pointer_address, 1, parameter_mode) * get_value(pointer_address, 2, parameter_mode)

        program[program[pointer_address + 3]] = prod
        pointer_address += 4
      when 3
        program[program[pointer_address + 1]] = inputs.shift
        pointer_address += 2
      when 4
        output.push(program[program[pointer_address + 1]])
        pointer_address += 2
      when 5
        if get_value(pointer_address, 1, parameter_mode) != 0
          pointer_address = get_value(pointer_address, 2, parameter_mode)
        else
          pointer_address += 3
        end
      when 6
        if get_value(pointer_address, 1, parameter_mode) == 0
          pointer_address = get_value(pointer_address, 2, parameter_mode)
        else
          pointer_address += 3
        end
      when 7
        if get_value(pointer_address, 1, parameter_mode) < get_value(pointer_address, 2, parameter_mode)
          program[program[pointer_address + 3]] = 1
        else
          program[program[pointer_address + 3]] = 0
        end
        pointer_address += 4
      when 8
        if get_value(pointer_address, 1, parameter_mode) == get_value(pointer_address, 2, parameter_mode)
          program[program[pointer_address + 3]] = 1
        else
          program[program[pointer_address + 3]] = 0
        end
        pointer_address += 4
      else
        raise "ERROR"
      end
    end
  end

  private

  def get_value(location, pos, mode)
    if pos == 1 && (mode % 10) == 1
      value = program[location + pos]
    elsif pos == 2 && mode >= 10
      value = program[location + pos]
    else
      value = program[program[location + pos]]
    end

    value
  end
end

