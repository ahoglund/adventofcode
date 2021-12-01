# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day5 < Adventofcode::Day
      def part_one
        vowels = /[aeiou]/
        #input = raw_input.split("\n")
        nice = 0

        input.each do |str|
          binding.pry
          next if str =~ /ab/
          next if str =~ /cd/
          next if str =~ /pq/
          next if str =~ /xy/

          tmp_nice = 0
          chars = str.split("")
          while chars
            prev = chars.shift
            if prev = chars[0]
              tmp_nice = 1
              break
            end
          end

          if tmp_nice = 1
            nice += tmp_nice
            tmp_nice = 0
            break
          end

          chars = str.split("")
          three_vowels = 0
          while chars
            char = chars.shift
            three_vowels += 1 if char =~ vowels
            if three_vowels == 3
              tmp_nice = 1
              break
            end
          end

          nice += tmp_nice
          tmp_nice = 0
        end

        nice
      end

      def part_two
      end
    end
  end
end
