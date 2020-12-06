# frozen_string_literal: true

require_relative '../helpers'

module Adventofcode
  module Year2020
    class Day6 < Adventofcode::Day

      include Adventofcode::Helpers

      def default_input
        raw_input.split("\n")
      end

      def part_one
        data = split_input_with_blank_line_delimeters(input)
        data.reduce(0) do |acc, datum|
          acc += datum.map { |d| d.split("") }.flatten.uniq.length
        end
      end

      def part_two
        data = split_input_with_blank_line_delimeters(input)

        data.reduce(0) do |acc, answers|
          all = answers.first.split("")

          answers[1..-1].each do |answer|
            all = all.intersection(answer.split(""))
          end

          acc += all.length
        end
      end
    end
  end
end


