# frozen_string_literal: true

require_relative '../helpers'

module Adventofcode
  module Year2020
    class Day4 < Adventofcode::Day

      REQUIRED_FIELDS = {
        "byr" => ->(field) { (1920..2002).cover?(field.to_i) },
        "iyr" => ->(field) { (2010..2020).cover?(field.to_i) },
        "eyr" => ->(field) { (2020..2030).cover?(field.to_i) },
        "hgt" => ->(field) do
          if field.end_with?("cm")
            (150..193).cover?(field[0..-3].to_i)
          elsif field.end_with?("in")
            (59..76).cover?(field[0..-3].to_i)
          else
            false
          end
        end,
        "hcl" => ->(field) { field.length == 7 && !!(field =~ /^#[a-f0-9]{6}/) },
        "ecl" => ->(field) { %w(amb blu brn gry grn hzl oth).one? { |cl| cl == field } },
        "pid" => ->(field) { !!(field =~ /^\d{9}$/) },
        "cid" => ->(field) { true },
      }

      def default_input
        raw_input.split("\n\n")
      end

      def part_one
        valid_passports = 0
        input.each do |data|
          fields = data.split(" ").flatten.map {|i| i.split(":") }
          result = REQUIRED_FIELDS.keys - fields.map {|a| a.first }
          if (result == [] || result == ["cid"])
            valid_passports += 1
          end
        end

        valid_passports
      end

      def part_two
        valid_passports = 0
        input.each do |data|
          fields = data.split(" ").flatten.map {|i| i.split(":") }
          result = REQUIRED_FIELDS.keys - fields.map {|a| a.first }
          if (result == [] || result == ["cid"]) && all_fields_valid?(fields)
            valid_passports += 1
          end
        end

        valid_passports
      end

      def all_fields_valid?(fields)
        fields.map { |(field, value)| REQUIRED_FIELDS[field].call(value) }.uniq == [true]
      end
    end
  end
end
