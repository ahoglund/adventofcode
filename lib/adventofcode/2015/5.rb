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
        input.select do |str|
          detect_pairs(str) && detect_repeats(str)
        end.length
      end

      def detect_repeats(str)
        (0..str.length - 2).each do |i|
          return true if str[i] == str[i + 2]
        end

        false
      end

      def detect_pairs(str)
        pairs = []
        (0..str.length - 1).each do |i|
          pairs << "#{str[i]}#{str[i + 1]}"
        end

        (0..pairs.length - 2).each do |i|
          (i + 2..pairs.length - 2).each do |x|
            return true if pairs[i] == pairs[x]
          end
        end

        false
      end
    end
  end
end
