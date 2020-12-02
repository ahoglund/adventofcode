require_relative "intcode_computer"
require "pry"

day = __FILE__.split(".").first
program = File.read("../inputs/#{day}.txt").split(",").map(&:to_i)

# 1
class Amp
  attr_reader :computer

  def initialize(program, phase_setting)
    @computer = IntcodeComputer.new(program, phase_setting)
  end

  def add_input(input)
    @computer.add_input(input)
  end

  def output
    binding.pry
    @computer.compute
    @computer.output
  end
end

class AmpCab
  attr_reader :amps

  def initialize(program, settings)
    @amps = settings.map do |setting|
      Amp.new(program, setting)
    end
  end

  def output
    amps.reduce(0) do |output, amp|
      amp.add_input(output)
      amp.output.first
    end
  end

  def feedback_output
    i = 0
    total_output = 0
    amps[i].add_input(0)

    while true
      this_amp_output = amps[i].output
      break unless this_amp_output
      total_output += this_amp_output
      amps[(i + 1) % 5].add_input(output)
      i += 1
    end

    total_output
  end
end

# outputs = (0..4).to_a.permutation.map do |phase_sequence|
#   AmpCab.new(program.clone, phase_sequence).output
# end
# puts outputs.max

feedback_outputs = (5..9).to_a.permutation.map do |phase_sequence|
  AmpCab.new(program.clone, phase_sequence).feedback_output
end
puts feedback_outputs.max
