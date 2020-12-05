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

      # input = %w(R2 R2 R2)
      # result = Adventofcode.part_one("2016", "1", input)
      # expect(result).to eq 2

      # input = %w(R2 R4 L2 R2)
      # result = Adventofcode.part_one("2016", "1", input)
      # expect(result).to eq 10

      # input = %w(R5 L5 R5 R3)
      # result = Adventofcode.part_one("2016", "1", input)
      # expect(result).to eq 12

      # result = Adventofcode.part_one("2016", "1")
      # expect(result).to eq 161
    end

    it "day one part two" do
      input = %w(R8 R4 R4 R8)
      result = Adventofcode.part_two("2016", "1", input)
      expect(result).to eq 4
    end
  end

  context "2019" do
    it "day three part one" do
      result = Adventofcode.part_one("2019", "3")
      expect(result).to eq 293
    end

    it "day three part two" do
      result = Adventofcode.part_two("2019", "3")
      expect(result).to eq 27306
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

    it "day four part one" do
      input=<<~INPUT
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in

ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm
INPUT

      result = Adventofcode.part_one("2020", "4", input.split("\n"))
      expect(result).to eq 3

      result = Adventofcode.part_one("2020", "4")
      expect(result).to eq 222
    end

    it "day four part two" do
input=<<~INPUT
iyr:2019 hcl:#602927 eyr:1967 hgt:170cm ecl:grn pid:012533040 byr:1946

pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989 iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785 hgt:164cm byr:2001 iyr:2015 cid:88 pid:545766238 ecl:hzl eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719

eyr:2029 hgt:151cm ecl:brn byr:2001 iyr:2019 pid:193029393 hcl:#d1614a cid:kd
INPUT

      result = Adventofcode.part_two("2020", "4", input.split("\n"))
      expect(result).to eq 5

      result = Adventofcode.part_two("2020", "4")
      expect(result).to eq 140
    end

    it "day five part one" do
      input = ["FBFBBFFRLR".split("")]
      result = Adventofcode.part_one("2020", "5", input)
      expect(result).to eq 357

      result = Adventofcode.part_one("2020", "5")
      expect(result).to eq 828
    end

    it "day five part one" do
      result = Adventofcode.part_two("2020", "5")
      expect(result).to eq 565
    end
  end
end
