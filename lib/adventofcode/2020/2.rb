# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day2 < Adventofcode::Day
      def default_input
        raw_input.split("\n")
      end

      LINE_REGEX = /^(\d+)-(\d+)\s+(\w):\s+(\w+)/

      def part_one
        valid_passwords = 0
        input.each do |line|
          match_data = line.match(LINE_REGEX)
          low        = match_data[1].to_i
          high       = match_data[2].to_i
          letter     = match_data[3]
          password   = match_data[4]

          count = 0
          password.split("").each do |char|
            if char == letter
              count += 1
            end
          end

          if count <= high && count >= low
            valid_passwords += 1
          end
        end

        valid_passwords
      end

      def part_two
        valid_passwords = 0
        input.each do |line|
          match_data = line.match(LINE_REGEX)
          low        = match_data[1].to_i
          high       = match_data[2].to_i
          letter     = match_data[3]
          password   = match_data[4]
          count      = 0

          if password[low - 1] == letter
            count += 1
          end

          if password[high - 1] == letter
            count += 1
          end

          valid_passwords += 1 if count == 1
        end

        valid_passwords
      end
    end
  end
end
