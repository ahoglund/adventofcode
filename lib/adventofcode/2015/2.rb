# frozen_string_literal: true

module Adventofcode
  module Year2015
    class Day2 < Adventofcode::Day

      def default_input
        raw_input.split("\n")
      end

      def part_one
        wrapping_paper, _ = process

        wrapping_paper
      end

      def part_two
        _, ribbon = process

        ribbon
      end

      def process
        wrapping_paper = 0
        ribbon = 0

        input.each do |dimensions|
          l, w, h = dimensions.split("x").map(&:to_i)
          area1   = (2 * (l * w))
          area2   = (2 * (w * h))
          area3   = (2 * (h * l))
          extra   = [area1, area2, area3].min / 2
          needed  = [area1, area2, area3, extra].sum

          wrapping_paper += needed

          # 2
          gwell = [l,w,h]
          bwell = []

          2.times do
            bwell << gwell.min
            gwell.delete_at(gwell.index(bwell.last))
          end

          ribbon_needed = bwell.map {|i| i + i }.sum
          bow_needed    = l * w * h

          ribbon += (ribbon_needed + bow_needed)
        end

        [wrapping_paper, ribbon]
      end
    end
  end
end

