# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day6 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        grid = Array.new(1000)
        (0..grid.length - 1).each { |i| grid[i] = Array.new(1000) }

        input.each do |instr|
          matches     = instr.match %r{(\d+,\d+) through (\d+,\d+)}
          start_range = matches[1].split(",").map(&:to_i)
          end_range   = matches[2].split(",").map(&:to_i)

          if instr.start_with?("turn on")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                grid[x][y] = 1
              end
            end
          elsif instr.start_with?("turn off")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                grid[x][y] = 0
              end
            end
          elsif instr.start_with?("toggle")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                if grid[x][y] == 0 || grid[x][y].nil?
                  grid[x][y] = 1
                else
                  grid[x][y] = 0
                end
              end
            end
          else
            raise
          end
        end

        count = 0
        grid.each_with_index do |row, x|
          row.each_with_index do |column, y|
            count += grid[x][y].to_i
          end
        end
        count
      end

      def part_two
        grid = Array.new(1000)
        (0..grid.length - 1).each { |i| grid[i] = Array.new(1000) }

        # init with zeros
        grid.each_with_index do |row, x|
          row.each_with_index do |column, y|
            grid[x][y] = 0
          end
        end

        input.each do |instr|
          matches     = instr.match %r{(\d+,\d+) through (\d+,\d+)}
          start_range = matches[1].split(",").map(&:to_i)
          end_range   = matches[2].split(",").map(&:to_i)

          if instr.start_with?("turn on")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                grid[x][y] += 1
              end
            end
          elsif instr.start_with?("turn off")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                grid[x][y] -= 1 unless grid[x][y] == 0
              end
            end
          elsif instr.start_with?("toggle")
            (start_range[0]..end_range[0]).each do |x|
              (start_range[1]..end_range[1]).each do |y|
                grid[x][y] += 2
              end
            end
          else
            raise
          end
        end

        count = 0
        grid.each_with_index do |row, x|
          row.each_with_index do |column, y|
            count += grid[x][y].to_i
          end
        end
        count
      end
    end
  end
end
