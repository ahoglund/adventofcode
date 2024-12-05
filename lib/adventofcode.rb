# require "adventofcode/version"
require 'pry'

module Adventofcode
  def self.part_one(year, day, input = nil)
    require File.join(File.absolute_path(File.dirname(__FILE__)), 'adventofcode', year, day)
    Object.const_get("Adventofcode::Year#{year}::Day#{day}").new(year, day, input).part_one
  end

  def self.part_two(year, day, input = nil)
    require File.join(File.absolute_path(File.dirname(__FILE__)), 'adventofcode', year, day)
    Object.const_get("Adventofcode::Year#{year}::Day#{day}").new(year, day, input).part_two
  end

  class Error < StandardError; end

  class Day
    attr_reader :year, :day, :input

    def initialize(year, day, input)
      @year  = year
      @day   = day
      @input = input || default_input
    end

    def default_input
      raw_input.split("\n").map(&:to_i)
    end

    def raw_input
      File.read(File.join(File.absolute_path(File.dirname(__FILE__)), 'adventofcode', year, 'inputs', "#{day}.txt"))
    end
  end
end
