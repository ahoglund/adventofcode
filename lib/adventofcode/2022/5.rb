require_relative "../helpers"
require "pry"

# https://adventofcode.com/2022/day/5
include Helpers

class Advent
  def data
    @data ||= DATA.read
  end

  def parse
    stacks, moves = paragraphs(data)

    split_stacks = stacks.split("\n")
    stack_numbers = split_stacks.pop

    parsed_stacks = split_stacks.each_with_object({}) do |stack, h|
      i = 1
      stack_numbers.split.map(&:to_i).each do |n|
        h[n] ||= []
        h[n] << stack[i] unless stack[i] == " " || stack[i].nil?
        i += 4
      end
    end

    parsed_moves = moves.split("\n").map do |move|
      move.match(/move (\d+) from (\d+) to (\d+)/).to_a[1..-1].map(&:to_i)
    end

    [parsed_stacks, parsed_moves]
  end

  def part_one
    stacks, moves = parse

    moves.each do |move|
      count, src, dest = move

      count.times do
        stacks[dest].prepend(stacks[src].shift)
      end
    end

    stacks.values.map(&:first).join
  end

  def part_two
    stacks, moves = parse

    moves.each do |move|
      count, src, dest = move
      n = []

      count.times do
        n << stacks[src].shift
      end

      stacks[dest] = n + stacks[dest]
    end

    stacks.values.map(&:first).join
  end
end

if $0 == __FILE__
  advent = Advent.new
  assert_equal advent.part_one, "QNNTGTPFN"
  assert_equal advent.part_two, "GGNPJBTTR"
end


__END__
[N]     [Q]         [N]
[R]     [F] [Q]     [G] [M]
[J]     [Z] [T]     [R] [H] [J]
[T] [H] [G] [R]     [B] [N] [T]
[Z] [J] [J] [G] [F] [Z] [S] [M]
[B] [N] [N] [N] [Q] [W] [L] [Q] [S]
[D] [S] [R] [V] [T] [C] [C] [N] [G]
[F] [R] [C] [F] [L] [Q] [F] [D] [P]
 1   2   3   4   5   6   7   8   9

move 3 from 9 to 4
move 2 from 5 to 2
move 8 from 1 to 9
move 4 from 7 to 1
move 5 from 3 to 8
move 3 from 3 to 7
move 11 from 8 to 3
move 7 from 3 to 6
move 2 from 5 to 9
move 3 from 1 to 6
move 6 from 2 to 4
move 6 from 7 to 5
move 1 from 6 to 1
move 1 from 9 to 4
move 16 from 4 to 9
move 2 from 1 to 2
move 1 from 4 to 6
move 1 from 3 to 7
move 2 from 2 to 4
move 1 from 7 to 9
move 22 from 9 to 8
move 1 from 6 to 3
move 18 from 8 to 5
move 3 from 8 to 2
move 3 from 2 to 9
move 13 from 6 to 7
move 1 from 6 to 7
move 4 from 3 to 6
move 2 from 6 to 3
move 2 from 3 to 8
move 3 from 7 to 8
move 14 from 5 to 2
move 3 from 2 to 5
move 2 from 8 to 4
move 4 from 8 to 6
move 4 from 6 to 4
move 11 from 5 to 2
move 3 from 9 to 2
move 7 from 2 to 3
move 11 from 7 to 2
move 1 from 5 to 7
move 5 from 6 to 8
move 30 from 2 to 7
move 23 from 7 to 2
move 4 from 3 to 4
move 3 from 9 to 6
move 4 from 8 to 2
move 1 from 8 to 2
move 2 from 7 to 9
move 4 from 2 to 3
move 1 from 5 to 9
move 6 from 4 to 7
move 5 from 3 to 6
move 1 from 3 to 6
move 1 from 9 to 2
move 16 from 2 to 5
move 7 from 7 to 6
move 9 from 2 to 1
move 2 from 1 to 4
move 8 from 5 to 3
move 5 from 7 to 4
move 1 from 9 to 8
move 9 from 3 to 6
move 25 from 6 to 8
move 2 from 9 to 5
move 3 from 4 to 2
move 7 from 4 to 1
move 1 from 8 to 7
move 6 from 5 to 2
move 11 from 8 to 5
move 1 from 7 to 9
move 10 from 1 to 2
move 6 from 5 to 1
move 1 from 4 to 2
move 13 from 8 to 1
move 17 from 1 to 2
move 5 from 1 to 9
move 1 from 8 to 4
move 1 from 1 to 3
move 1 from 3 to 6
move 1 from 9 to 3
move 2 from 4 to 5
move 1 from 4 to 8
move 1 from 9 to 1
move 8 from 5 to 7
move 1 from 8 to 1
move 7 from 7 to 6
move 2 from 1 to 2
move 1 from 3 to 6
move 2 from 5 to 4
move 8 from 2 to 1
move 1 from 9 to 7
move 1 from 5 to 1
move 2 from 7 to 3
move 2 from 3 to 7
move 2 from 7 to 8
move 2 from 1 to 5
move 3 from 9 to 2
move 2 from 8 to 9
move 1 from 9 to 2
move 1 from 9 to 8
move 1 from 8 to 7
move 6 from 6 to 5
move 1 from 6 to 2
move 2 from 4 to 5
move 2 from 6 to 8
move 1 from 7 to 1
move 2 from 8 to 4
move 11 from 2 to 5
move 18 from 5 to 6
move 6 from 2 to 6
move 10 from 2 to 7
move 1 from 4 to 3
move 7 from 2 to 8
move 7 from 1 to 4
move 6 from 7 to 8
move 2 from 7 to 3
move 8 from 4 to 7
move 1 from 1 to 3
move 1 from 2 to 1
move 4 from 7 to 1
move 4 from 1 to 3
move 2 from 3 to 9
move 2 from 5 to 4
move 1 from 2 to 1
move 2 from 1 to 5
move 1 from 3 to 1
move 2 from 5 to 2
move 1 from 2 to 6
move 5 from 7 to 4
move 1 from 1 to 2
move 10 from 8 to 1
move 2 from 2 to 7
move 2 from 7 to 1
move 1 from 7 to 9
move 1 from 5 to 7
move 3 from 8 to 7
move 3 from 3 to 6
move 3 from 7 to 1
move 5 from 1 to 4
move 1 from 7 to 6
move 22 from 6 to 3
move 2 from 6 to 2
move 19 from 3 to 4
move 15 from 4 to 8
move 9 from 8 to 4
move 5 from 6 to 8
move 2 from 2 to 8
move 2 from 9 to 4
move 7 from 1 to 5
move 1 from 1 to 3
move 1 from 9 to 7
move 5 from 8 to 3
move 4 from 8 to 1
move 5 from 1 to 5
move 10 from 4 to 3
move 3 from 4 to 2
move 2 from 8 to 3
move 12 from 4 to 8
move 1 from 7 to 6
move 3 from 2 to 9
move 2 from 4 to 5
move 5 from 3 to 7
move 1 from 7 to 2
move 1 from 1 to 6
move 1 from 7 to 2
move 15 from 3 to 8
move 10 from 5 to 6
move 3 from 7 to 8
move 1 from 5 to 8
move 1 from 2 to 3
move 7 from 6 to 1
move 3 from 5 to 3
move 5 from 3 to 5
move 3 from 5 to 4
move 2 from 4 to 9
move 2 from 3 to 5
move 14 from 8 to 5
move 1 from 9 to 1
move 16 from 5 to 3
move 16 from 3 to 6
move 2 from 9 to 8
move 21 from 6 to 7
move 2 from 1 to 7
move 1 from 2 to 7
move 4 from 1 to 7
move 1 from 4 to 7
move 16 from 8 to 5
move 20 from 7 to 4
move 1 from 9 to 8
move 1 from 7 to 4
move 3 from 8 to 6
move 1 from 9 to 1
move 2 from 1 to 4
move 2 from 5 to 2
move 5 from 4 to 7
move 1 from 6 to 9
move 11 from 7 to 6
move 2 from 7 to 5
move 12 from 6 to 2
move 13 from 2 to 1
move 1 from 2 to 3
move 1 from 8 to 4
move 6 from 4 to 1
move 1 from 6 to 7
move 7 from 4 to 9
move 8 from 9 to 3
move 2 from 8 to 3
move 10 from 5 to 4
move 11 from 1 to 8
move 1 from 1 to 3
move 5 from 1 to 8
move 8 from 5 to 6
move 13 from 8 to 9
move 12 from 3 to 5
move 12 from 5 to 9
move 1 from 7 to 9
move 1 from 1 to 2
move 1 from 1 to 4
move 3 from 8 to 5
move 1 from 2 to 5
move 1 from 4 to 8
move 5 from 6 to 3
move 1 from 8 to 4
move 13 from 4 to 7
move 3 from 7 to 6
move 1 from 1 to 4
move 4 from 4 to 2
move 1 from 6 to 3
move 2 from 5 to 9
move 2 from 5 to 9
move 1 from 4 to 8
move 6 from 9 to 4
move 22 from 9 to 2
move 8 from 7 to 4
move 7 from 2 to 1
move 3 from 3 to 8
move 2 from 6 to 7
move 14 from 4 to 2
move 2 from 6 to 1
move 1 from 8 to 7
move 3 from 3 to 9
move 1 from 8 to 4
move 3 from 1 to 9
move 3 from 9 to 3
move 31 from 2 to 8
move 8 from 8 to 4
move 1 from 9 to 1
move 9 from 4 to 5
move 7 from 5 to 6
move 2 from 5 to 1
move 1 from 2 to 1
move 1 from 7 to 9
move 1 from 2 to 9
move 2 from 6 to 4
move 4 from 7 to 4
move 4 from 9 to 8
move 6 from 4 to 1
move 1 from 3 to 2
move 1 from 3 to 6
move 1 from 9 to 2
move 2 from 2 to 4
move 1 from 9 to 1
move 1 from 3 to 1
move 17 from 1 to 9
move 4 from 6 to 2
move 1 from 9 to 7
move 4 from 9 to 7
move 1 from 8 to 4
move 3 from 7 to 6
move 1 from 4 to 9
move 10 from 8 to 5
move 6 from 6 to 5
move 1 from 7 to 2
move 1 from 1 to 4
move 1 from 4 to 5
move 9 from 8 to 3
move 4 from 3 to 9
move 1 from 4 to 6
move 1 from 6 to 5
move 1 from 4 to 8
move 2 from 3 to 8
move 1 from 3 to 8
move 3 from 8 to 9
move 5 from 2 to 9
move 1 from 7 to 9
move 5 from 8 to 7
move 3 from 8 to 4
move 2 from 8 to 5
move 24 from 9 to 7
move 1 from 3 to 5
move 2 from 9 to 4
move 22 from 7 to 9
move 1 from 3 to 4
move 6 from 4 to 6
move 4 from 6 to 7
move 10 from 5 to 3
move 8 from 3 to 5
move 2 from 3 to 4
move 2 from 4 to 6
move 10 from 7 to 3
move 21 from 9 to 1
move 2 from 3 to 4
move 4 from 3 to 8
move 2 from 4 to 8
move 1 from 7 to 8
move 4 from 6 to 8
move 3 from 5 to 4
move 8 from 8 to 2
move 18 from 1 to 6
move 3 from 4 to 1
move 1 from 2 to 8
move 5 from 1 to 8
move 3 from 3 to 6
move 3 from 2 to 9
move 3 from 8 to 1
move 11 from 5 to 2
move 3 from 8 to 7
move 10 from 2 to 9
move 1 from 7 to 9
move 3 from 8 to 1
move 2 from 7 to 8
move 6 from 9 to 5
move 4 from 2 to 8
move 8 from 5 to 8
move 1 from 3 to 7
move 2 from 5 to 6
move 3 from 1 to 6
move 2 from 1 to 6
move 4 from 9 to 8
move 4 from 9 to 8
move 1 from 9 to 4
move 9 from 6 to 9
move 16 from 6 to 9
move 1 from 4 to 7
move 1 from 2 to 9
move 5 from 8 to 5
move 4 from 5 to 1
move 6 from 1 to 7
move 12 from 8 to 4
move 5 from 8 to 1
move 6 from 9 to 3
move 1 from 1 to 6
move 2 from 5 to 8
move 12 from 4 to 7
move 2 from 8 to 4
move 1 from 4 to 8
move 1 from 7 to 6
move 1 from 4 to 6
move 14 from 7 to 1
move 3 from 3 to 2
move 7 from 9 to 7
move 3 from 3 to 5
move 15 from 1 to 2
move 2 from 5 to 9
move 1 from 8 to 9
move 16 from 9 to 1
move 1 from 5 to 9
move 5 from 6 to 2
move 12 from 7 to 2
move 20 from 2 to 6
move 10 from 2 to 6
move 11 from 1 to 7
move 2 from 7 to 4
move 2 from 2 to 5
move 1 from 2 to 3
move 2 from 5 to 6
move 1 from 9 to 5
move 1 from 5 to 9
move 25 from 6 to 7
move 25 from 7 to 6
move 1 from 3 to 1
move 1 from 2 to 5
move 1 from 4 to 3
move 33 from 6 to 3
move 1 from 9 to 5
move 2 from 3 to 5
move 28 from 3 to 9
move 5 from 1 to 9
move 4 from 1 to 8
move 2 from 3 to 2
move 2 from 8 to 1
move 1 from 4 to 6
move 3 from 5 to 3
move 1 from 2 to 4
move 2 from 2 to 8
move 1 from 6 to 5
move 30 from 9 to 2
move 7 from 2 to 6
move 1 from 1 to 3
move 1 from 1 to 7
move 1 from 5 to 6
move 1 from 5 to 4
move 5 from 7 to 4
move 4 from 7 to 3
move 1 from 3 to 7
move 3 from 8 to 7
move 8 from 3 to 1
move 3 from 1 to 7
move 4 from 1 to 4
move 3 from 9 to 8
move 8 from 6 to 2
move 18 from 2 to 6
move 6 from 7 to 2
move 1 from 1 to 7
move 3 from 4 to 7
move 5 from 4 to 8
move 2 from 8 to 7
move 7 from 2 to 5
move 5 from 2 to 7
move 10 from 7 to 9
move 5 from 5 to 9
move 1 from 3 to 9
move 5 from 2 to 6
move 3 from 7 to 9
move 2 from 5 to 6
move 2 from 2 to 9
move 2 from 8 to 7
move 1 from 4 to 5
move 8 from 9 to 2
move 5 from 6 to 7
move 4 from 9 to 1
move 4 from 8 to 9
move 12 from 9 to 1
move 16 from 1 to 4
move 12 from 6 to 2
move 3 from 7 to 6
move 3 from 7 to 3
move 1 from 9 to 4
move 12 from 4 to 5
move 2 from 4 to 3
move 1 from 7 to 1
move 4 from 4 to 3
move 1 from 8 to 2
move 6 from 3 to 1
move 1 from 1 to 8
move 7 from 2 to 5
move 1 from 8 to 1
move 4 from 5 to 4
move 5 from 5 to 9
move 1 from 3 to 8
move 1 from 9 to 7
move 1 from 8 to 1
move 4 from 5 to 6
move 5 from 5 to 9
move 7 from 9 to 5
move 11 from 6 to 4
move 1 from 9 to 4
move 1 from 9 to 1
move 1 from 7 to 2
move 9 from 4 to 3
move 5 from 1 to 9
move 3 from 5 to 1
move 5 from 9 to 8
move 8 from 3 to 1
move 2 from 5 to 3
move 7 from 2 to 5
move 1 from 6 to 4
move 3 from 5 to 9
move 3 from 6 to 9
move 3 from 2 to 9
move 5 from 3 to 6
move 1 from 9 to 5
move 4 from 8 to 3
move 1 from 8 to 4
move 8 from 1 to 3
move 12 from 3 to 7
move 1 from 2 to 4
move 3 from 2 to 8
move 6 from 7 to 6
move 4 from 5 to 7
move 5 from 9 to 7
move 2 from 9 to 2
move 1 from 9 to 5
move 4 from 5 to 1
move 1 from 5 to 4
move 14 from 7 to 6
move 1 from 1 to 7
move 10 from 4 to 5
move 4 from 1 to 2
move 1 from 4 to 6
move 1 from 7 to 4
move 17 from 6 to 8
move 1 from 5 to 7
move 10 from 5 to 4
move 1 from 2 to 6
move 4 from 2 to 6
move 13 from 6 to 1
move 9 from 4 to 3
move 2 from 2 to 4
move 1 from 6 to 7
move 1 from 4 to 3
move 8 from 3 to 5
move 1 from 3 to 4
move 17 from 1 to 3
move 15 from 3 to 7
move 3 from 4 to 1
move 6 from 8 to 9
move 6 from 9 to 1
move 2 from 3 to 1
move 2 from 5 to 2
move 6 from 7 to 6
move 3 from 6 to 9
