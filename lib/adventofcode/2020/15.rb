# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day15 < Adventofcode::Day
      class Numbers

        attr_reader :spoken
        def initialize
          @spoken = {}
        end

        def spoken?(number)
          @spoken[number] && @spoken[number].any?
        end

        def add_spoken(number, position)
          @spoken[number] ||= []
          @spoken[number] << position
        end
      end

      def part_one
        numbers = Numbers.new
        input.each_with_index { |n, i| numbers.add_spoken(n,i + 1) }
        last_spoken = input.last
        i = input.length + 1
        while i <= 2020
          if numbers.spoken?(last_spoken)
            if numbers.spoken[last_spoken].length == 1
              last_spoken = 0
              numbers.add_spoken(last_spoken, i)
            else
              last_spoken = (numbers.spoken[last_spoken][-1] - numbers.spoken[last_spoken][-2])
              numbers.add_spoken(last_spoken, i)
            end
          else
            numbers.add_spoken(last_spoken, i)
          end
          i += 1
        end

        numbers.spoken.detect { |x, y| y.include?(2020) }.first
      end

      def part_two
        numbers = Numbers.new
        input.each_with_index { |n, i| numbers.add_spoken(n,i + 1) }
        last_spoken = input.last
        i = input.length + 1
        while i <= 30_000_000
          if numbers.spoken?(last_spoken)
            if numbers.spoken[last_spoken].length == 1
              last_spoken = 0
              numbers.add_spoken(last_spoken, i)
            else
              last_spoken = (numbers.spoken[last_spoken][-1] - numbers.spoken[last_spoken][-2])
              numbers.add_spoken(last_spoken, i)
            end
          else
            numbers.add_spoken(last_spoken, i)
          end
          i += 1
        end

        numbers.spoken.detect { |x, y| y.include?(30_000_000) }.first
      end
    end
  end
end
