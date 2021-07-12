# frozen_string_literal: true

module Adventofcode
  module Year2020
    class Day13 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        minutes = input[0].to_i
        bus_ids = input[1].split(",").filter {|b| b!="x"}.map(&:to_i)

        closest = bus_ids.first
        difference = 0
        bus_ids.map do |bus_id|
          if (((minutes / bus_id) + 1) * bus_id) < (((minutes / closest) + 1) * closest)
            difference = (((minutes / bus_id) + 1) * bus_id) - minutes
            closest = bus_id
          end
        end

        closest * difference
      end

      class Bus
        attr_reader :id
        attr_accessor :plus, :last_departure
        def initialize(id)
          @id = id.to_i
        end

        def departs_after(prev_bus)
          (self.last_departure - prev_bus.last_departure) == self.plus
        end
      end

      def part_two
        count = 1
        buses = input[1].split(",").flat_map do |bus|
          if bus == 'x'
            count +=1
            next
          end
          bus = Bus.new(bus)
          bus.plus = count
          count = 1
          bus
        end.compact

        time = 100_000_000_000_000
        increment = buses.first.id
        while true
          # This solution is good for smaller size input, but for the real
          # problem we need to turn to the chinese remainder theorem.
          #
          #
          # if (time % prev_bus.id) == 0
          #   good = true
          #   prev_bus.last_departure = time
          #   # we've found an inital bus that works, lets check the rest
          #   (1..buses.length - 1).each do |i|
          #     # the next bus is good too, lets proceed
          #     if (prev_bus.last_departure + buses[i].plus) % buses[i].id == 0
          #       prev_bus = buses[i]
          #       prev_bus.last_departure = time + prev_bus.plus
          #       time += prev_bus.plus
          #     else
          #       # the next bus isn't good so lets get out of here
          #       prev_bus = buses.first
          #       time += increment
          #       good = false
          #       break
          #     end
          #   end
          # else
          #   time += 1
          # end

          # # we fell all the way through the list of buses, we good
          # if good
          #   break
          # end
        end

        buses.first.last_departure
      end
    end
  end
end
