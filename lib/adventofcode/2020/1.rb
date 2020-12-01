# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day1 < Adventofcode::Day
      def part_one
        input.each do |i|
          input.each do |x|
            if (i.to_i + x.to_i) == 2020
              return i.to_i * x.to_i
            end
          end
        end
      end

      def part_two
        input.each do |i|
          input.each do |x|
            input.each do |y|
              if (i.to_i + x.to_i + y.to_i) == 2020
                return i.to_i * x.to_i * y.to_i
              end
            end
          end
        end
      end
    end
  end
end
