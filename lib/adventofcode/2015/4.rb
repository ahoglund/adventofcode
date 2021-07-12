# frozen_string_literal: true

require 'digest'
module Adventofcode
  module Year2015
    class Day4 < Adventofcode::Day
      def part_one
        (0..100_000_000).each do |i|
          md5 = Digest::MD5.hexdigest("#{input}#{i}")
          return i if md5 =~ /^00000/
        end
      end

      def part_two
        (0..100_000_000).each do |i|
          md5 = Digest::MD5.hexdigest("#{input}#{i}")
          return i if md5 =~ /^000000/
        end
      end
    end
  end
end
