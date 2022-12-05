require_relative "../helpers"
require "pry"

# https://adventofcode.com/####/day/#
include Helpers

class Advent
  def data
    @data ||= DATA.read.split("\n").map(&:chars)
  end

  def part_one
    c = 0

    # most common, alphabetically first
    data.map do |line|
      a = line.join.scan(/([a-z-]+)(\d+)\[([a-z]+)\]/).first
      b = a[0].split("-").join.split("").each_with_object(Hash.new(0)) { |c, h| h[c] += 1 }
    end

    c
  end

  def part_two
  end
end

if $0 == __FILE__
  advent = Advent.new
  assert_equal advent.part_one, 1234
  assert_equal advent.part_two, 5678
end

__END__
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
