RSpec.describe Adventofcode do
  context "2015" do
    it "day one part one" do
      result = Adventofcode.part_one("2015", "1")
      expect(result).to eq 74
    end

    it "day one part two" do
      result = Adventofcode.part_two("2015", "1")
      expect(result).to eq 1795
    end

    it "day two part one" do
      result = Adventofcode.part_one("2015", "2")
      expect(result).to eq 1588178
    end

    it "day two part two" do
      result = Adventofcode.part_two("2015", "2")
      expect(result).to eq 3783758
    end
  end

  context "2016" do
    it "day one part one" do
      input = %w(R2 L3)
      result = Adventofcode.part_one("2016", "1", input)
      expect(result).to eq 5

      input = %w(R2 R2 R2)
      result = Adventofcode.part_one("2016", "1", input)
      expect(result).to eq 2

      input = %w(R2 R4 L2 R2)
      result = Adventofcode.part_one("2016", "1", input)
      expect(result).to eq 10

      input = %w(R5 L5 R5 R3)
      result = Adventofcode.part_one("2016", "1", input)
      expect(result).to eq 12

      result = Adventofcode.part_one("2016", "1")
      expect(result).to eq 161
    end

    it "day one part two" do
      # input = %w(R8 R4 R4 R8)
      # result = Adventofcode.part_two("2016", "1", input)
      # expect(result).to eq 4
    end
  end

  context "2020" do
    it "day one part one" do
      # example
      input = %w(1721 979 366 299 675 1456)
      result = Adventofcode.part_one("2020", "1", input)
      expect(result).to eq 514579

      # real
      result = Adventofcode.part_one("2020", "1")
      expect(result).to eq 181044
    end

    it "day one part two" do
      # example
      input = %w(1721 979 366 299 675 1456)
      result = Adventofcode.part_two("2020", "1", input)
      expect(result).to eq 241861950

      # real
      result = Adventofcode.part_two("2020", "1")
      expect(result).to eq 82660352
    end

    it "day two part one" do
      # example
      input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
      result = Adventofcode.part_one("2020", "2", input)
      expect(result).to eq 2

      # real
      result = Adventofcode.part_one("2020", "2")
      expect(result).to eq 666
    end

    it "day two part two" do
      input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
      result = Adventofcode.part_two("2020", "2", input)
      expect(result).to eq 1

      result = Adventofcode.part_two("2020", "2")
      expect(result).to eq 670
    end

    it "day three part one" do
      input=<<~INPUT
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
      INPUT

      result = Adventofcode.part_one("2020", "3", input.split("\n"))
      expect(result).to eq 7

      result = Adventofcode.part_one("2020", "3")
      expect(result).to eq 292
    end

    it "day three part two" do
      input=<<~INPUT
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
      INPUT

      result = Adventofcode.part_two("2020", "3", input.split("\n"))
      expect(result).to eq 336

      result = Adventofcode.part_two("2020", "3")
      expect(result).to eq 9354744432
    end
  end
end
