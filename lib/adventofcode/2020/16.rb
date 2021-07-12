# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day16 < Adventofcode::Day

      def default_input
        raw_input.split("\n\n")
      end

      def part_one
        validate_tickets[1].sum
      end


      def ranges
        @ranges ||= input.first.split("\n").map { |m| m.match(/^(.+):\s+(\d+-\d+)\s+or\s+(\d+-\d+)/) }
          .reduce({}) { |acc, md| acc[md[1]] = [md[2].split("-").flat_map(&:to_i), md[3].split("-").map(&:to_i)]; acc }
          .reduce({}) { |acc, (k,v)| acc[k] = v.flat_map { |r| (r[0]..r[1]) }; acc }
      end

      def nearby_tickets
        @nearby_tickets ||= input[2].split("\n")[1..-1].map { |i| i.split(",").map(&:to_i) }
      end

      def my_ticket
        @my_ticket ||= input[1].split("\n")[1..-1].map { |i| i.split(",").map(&:to_i) }
      end

      def validate_tickets
        valid_tickets = []
        invalid_tickets = []
        error_rate = nearby_tickets.flatten.reduce(0) do |error_rate, nearby_ticket|
          covered = false

          ranges.values.flatten.each do |range|
            covered = true if range.cover?(nearby_ticket)
          end

          unless covered
            invalid_tickets << nearby_ticket
          else
            valid_tickets << nearby_ticket
          end

          error_rate
        end

        [valid_tickets, invalid_tickets]
      end

      def part_two
        field_indexes = {}
        field_assignments = {}
        tickets = nearby_tickets.dup

        idx = 1
        until tickets.all? { |t| t.empty? }
          a = tickets.map { |t| t.shift }
          ranges.each do |name, rgs|
            if a.all? { |t| rgs[0].cover?(t) || rgs[1].cover?(t) }
              field_indexes[name] ||=  []
              field_indexes[name] << idx
            end
          end
          idx += 1
        end

        #field_indexes =  field_indexes.filter { |k| k =~ /^departure/ }
        binding.pry
        while field_indexes.any?
          single = field_indexes.detect {|k,v| v.length == 1 }
          field_indexes.delete(single[0])
          field_indexes.each do |k,v|
            field_indexes[k] = v - single[1]
          end

          field_assignments[single[0]] = single[1][0]
        end

        field_assignments.map do |k,v|
          [k, my_ticket[0][v - 1]]
        end
      end
    end
  end
end
