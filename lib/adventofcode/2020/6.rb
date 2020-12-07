# frozen_string_literal: true

require_relative '../helpers'

module Adventofcode
  module Year2020
    class Day6 < Adventofcode::Day

      include Adventofcode::Helpers

      def default_input
        raw_input.split("\n\n")
      end

      def part_one
        input.reduce(0) do |acc, datum|
          acc += datum.split("\n").map { |d| d.split("") }.flatten.uniq.length
        end
      end

      def part_two
        input.reduce(0) do |acc, group|
          answers = group.split("\n")
          all     = answers.first.split("")

          answers[1..-1].each do |answer|
            all = all & answer.split("")
          end

          acc += all.length
        end
      end
    end
  end
end


