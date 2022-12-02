require_relative "../helpers"
require "pry"

# https://adventofcode.com/####/day/#
include Helpers

class Advent
  def data
    @data ||= DATA.read.split("\n").map(&:chars)
  end

  def part_one
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
# INPUT HERE
