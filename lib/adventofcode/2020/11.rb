# frozen_string_literal: true

require_relative '../../adventofcode'
module Adventofcode
  module Year2020
    class Day11 < Adventofcode::Day

      FLOOR    = "."
      EMPTY    = "L"
      OCCUPIED = "#"
      ROUNDS   = 5

      # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
      # If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
      # Otherwise, the seat's state does not change.

      def default_input
        raw_input.split("\n").map { |l| l.split("") }
      end


      def coords_to_check(line_idx, seat_idx, mult)
        [
          [seat_idx + ( -1 * mult), line_idx + ( -1 * mult)],
          [seat_idx + ( -1 * mult), line_idx + (  0 * mult)],
          [seat_idx + ( -1 * mult), line_idx + (  1 * mult)],
          [seat_idx + (  0 * mult), line_idx + ( -1 * mult)],
          [seat_idx + (  0 * mult), line_idx + (  1 * mult)],
          [seat_idx + (  1 * mult), line_idx + ( -1 * mult)],
          [seat_idx + (  1 * mult), line_idx + (  0 * mult)],
          [seat_idx + (  1 * mult), line_idx + (  1 * mult)]
        ].reject { |coord| coord[0].negative? || coord[1].negative? }
      end

      def part_two
        seat_map     = input.clone.map(&:clone)
        new_seat_map = []
        while true
          coords_to_update =  {}
          (0..(seat_map.length - 1)).each do |line_idx|
            (0..(seat_map[line_idx].length - 1)).each do |seat_idx|
              occupied = 0
              next if seat_map[line_idx][seat_idx] == FLOOR
              (0..(coords_to_check(line_idx, seat_idx, 1).length - 1)).each do |i|
                mult = 1
                while true
                  coord = coords_to_check(line_idx, seat_idx, mult)[i]
                  mult +=1
                  break unless coord
                  if seat_map[coord[1]] && seat_map[coord[1]][coord[0]]
                    if seat_map[coord[1]][coord[0]] == EMPTY
                      break
                    elsif seat_map[coord[1]][coord[0]] == OCCUPIED
                      occupied += 1
                      break
                    end
                  else
                    break
                  end
                end
              end

              if occupied == 0 && seat_map[line_idx][seat_idx] == EMPTY
                coords_to_update[OCCUPIED] ||= []
                coords_to_update[OCCUPIED] << [line_idx, seat_idx]
              end
              if occupied >= 5
                coords_to_update[EMPTY] ||= []
                coords_to_update[EMPTY] << [line_idx,seat_idx]
              end
            end
          end

          coords_to_update.each do |type, coords|
            coords.each do |coord|
              seat_map[coord[0]][coord[1]] = type
            end
          end

          break if new_seat_map == seat_map
          new_seat_map = seat_map.clone.map(&:clone)
          # new_seat_map.map { |p| puts p.join("") }
          # sleep 1
          # puts "\e[H\e[2J"
        end

        new_seat_map.reduce(0) do |acc, line|
          acc += line.select { |x| x == "#" }.count
          acc
        end
      end

      # def part_two
      # end
    end
  end
end
