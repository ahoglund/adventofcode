# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day5 < Adventofcode::Day
      def default_input
        raw_input.split("\n")
      end

      def part_one
        input.select do |str|
          nice = false
          next if str =~ /ab/
          next if str =~ /cd/
          next if str =~ /pq/
          next if str =~ /xy/
          next unless str.split("").select { |c| c =~ /a|e|i|o|u/ }.join.size >= 3

          i = 0
          (1..(str.length - 1)).each do |x|
            if str[i] == str[x]
              nice = true
              break
            end
            i += 1
          end

          nice
        end.length
      end

      def part_two
      end
    end
  end
end
