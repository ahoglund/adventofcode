# https://adventofcode.com/2016/day/2
class Advent
  def data
    @data ||= DATA.each_line.to_a
  end

  def part_one
    # if U then subtract
    # subtract if code > 3
    #
    # if D then add 3
    # add if code is < 7
    #
    # if L then subtract 1
    # dont subtract if 1 and L
    # dont subtract if 4 and L
    # dont subtract if 7 and L
    # if code % 3 != 1 (this only adds when not 1,4,7. 2,5,8 modulo to 2 and 3,6,9 modulo to 0)
    #
    # if R then add 1
    # dont add if 3 and R
    # dont add if 6 and R
    # dont add if 9 and R
    # or
    # if code % 3 != 0 (this only adds when not 3,6,9)
    exp = 10_000
    bath_code = 0
    data.each do |line|
      code = 5
      line.chars.each do |char|
        case char
        when "U"
          code -= 3 if code > 3
        when "D"
          code += 3 if code < 7
        when "L"
          code -= 1 if code % 3 != 1
        when "R"
          code += 1 if code % 3 != 0
        end
      end

      bath_code += code * exp

      exp /= 10
    end

    bath_code
  end

  def part_two
    grid = [
      [nil, nil, 1, nil, nil],
      [nil, 2, 3, 4, nil],
      [5, 6, 7, 8, 9],
      [nil, "A", "B", "C", nil],
      [nil, nil, "D", nil, nil],
    ]

    pos = [2, 0]
    parts = []
    i = 0
    code = grid[pos[0]][pos[1]]
    data.each do |line|
      char_pos = 0
      line.chomp.chars.each do |char|
        case char
        when "U"
          require "pry"; binding.pry
          if next_pos = grid[pos[0] - 1][pos[1]]
            code = next_pos
            pos[0] -= 1
            next
          end
        when "D"
          if next_pos = grid[pos[0] + 1][pos[1]]
            code = next_pos
            pos[0] += 1
            next
          end
        when "L"
          if next_pos = grid[pos[0]][pos[1] - 1]
            code = next_pos
            pos[1] -= 1
            next
          end
        when "R"
          if next_pos = grid[pos[0]][pos[1] + 1]
            code = next_pos
            pos[1] += 1
            next
          end
        end
        char_pos += 1
      end

      parts[i] = code
      i += 1
    end

    parts.join
  end
end

if $0 == __FILE__
  # puts Advent.new.part_one
  puts Advent.new.part_two
end

__END__
ULL
RRDDD
LURDL
UUUUD
