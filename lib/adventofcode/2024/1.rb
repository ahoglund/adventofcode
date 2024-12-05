# frozen_string_literal: true

module Adventofcode
  module Year2024
    class Day1 < Adventofcode::Day
      def part_one
        # split_input = input.split("\n").map { |l| l.split(' ').map(&:to_i) }
        split_input = raw_input.split("\n").map { |l| l.split(' ').map(&:to_i) }

        left_sorted = split_input.map { |i| i[0] }.sort
        right_sorted = split_input.map { |i| i[1] }.sort

        distances = 0
        (0..left_sorted.length - 1).each do |i|
          distances += (left_sorted[i] - right_sorted[i]).abs
        end

        distances
      end

      def part_two
        split_input = input.split("\n").map { |l| l.split(' ').map(&:to_i) }
        split_input = raw_input.split("\n").map { |l| l.split(' ').map(&:to_i) }

        right_counts = Hash.new(0)
        split_input.map { |i| i[1] }.map { |i| right_counts[i] += 1 }

        similarity_score = 0
        (0..split_input.length - 1).each do |i|
          # check the left value and then multiple it by the counts value in the hash.
          similarity_score += split_input[i][0] * right_counts[split_input[i][0]]
        end

        similarity_score
      end
    end
  end
end
