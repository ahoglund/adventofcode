# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day7 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      COLOR = "shiny gold"

      def part_one
        parents.reduce(0) do |acc, (parent, children)|
          acc += 1 if look_for(COLOR, children)
          acc
        end
      end

      def look_for(color, children)
        return true if children.map { |a| a[0] }.include?(color)

        children.detect do |child|
          look_for(color, parents[child[0]])
        end
      end

      def parents
        @parents ||= input.each_with_object({}) do |line, obj|
          parent = line.match(/(\w+\s+\w+)/)[1]
          children = line
            .split("contain")[1]
            .split(",")
            .map { |m| cap = m.match(/(\d+)\s+(\w+\s+\w+)\s+bags?/); [cap[2], cap[1].to_i] if cap }
            .compact

          obj[parent] = children
        end
      end

      def total(children)
        return 0 if children.empty?
        children.map do |(child, count)|
          count + (count * total(parents[child]))
        end.sum
      end

      def part_two
        total(parents[COLOR])
      end
    end
  end
end
