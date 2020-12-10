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
      expect(result).to eq 2

      input = %w(R5 L5 R5 R3)
      result = Adventofcode.part_one("2016", "1", input)
      expect(result).to eq 12

      result = Adventofcode.part_one("2016", "1")
      expect(result).to eq 161
    end

    it "day one part two" do
      input = %w(R8 R4 R4 R8)
      result = Adventofcode.part_two("2016", "1", input)
      expect(result).to eq 4
      result = Adventofcode.part_two("2016", "1")
      expect(result).to eq 110
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

      result = Adventofcode.part_one("2020", "4", input.split("\n\n"))
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

      result = Adventofcode.part_two("2020", "4", input.split("\n\n"))
      expect(result).to eq 5

      result = Adventofcode.part_two("2020", "4")
      expect(result).to eq 140
    end

    it "day five part one" do
      input = ["FBFBBFFRLR"]
      result = Adventofcode.part_one("2020", "5", input)
      expect(result).to eq 357

      result = Adventofcode.part_one("2020", "5")
      expect(result).to eq 828
    end

    it "day five part two" do
      result = Adventofcode.part_two("2020", "5")
      expect(result).to eq 565
    end

    it "day six part one" do
      input=<<~INPUT
abc

a
b
c

ab
ac

a
a
a
a

b
      INPUT
      result = Adventofcode.part_one("2020", "6", input.split("\n\n"))
      expect(result).to eq 11

      result = Adventofcode.part_one("2020", "6")
      expect(result).to eq 6416

      result = Adventofcode.part_two("2020", "6", input.split("\n\n"))
      expect(result).to eq 6

      result = Adventofcode.part_two("2020", "6")
      expect(result).to eq 3050
    end

    it "day seven part one" do
      input=<<~INPUT
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
INPUT

      result = Adventofcode.part_one("2020", "7", input.split("\n"))
      expect(result).to eq 4

      result = Adventofcode.part_one("2020", "7")
      expect(result).to eq 265
    end

    it "day seven part two" do
        input=<<~INPUT
shiny gold bags contain 2 dark red bags.
dark red bags contain 2 dark orange bags.
dark orange bags contain 2 dark yellow bags.
dark yellow bags contain 2 dark green bags.
dark green bags contain 2 dark blue bags.
dark blue bags contain 2 dark violet bags.
dark violet bags contain no other bags.
INPUT
      result = Adventofcode.part_two("2020", "7", input.split("\n"))
      expect(result).to eq 126

      result = Adventofcode.part_two("2020", "7")
      expect(result).to eq 14177
    end

    it "day eight part one" do
      input=<<~INPUT
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
INPUT

      result = Adventofcode.part_one("2020", "8", input.split("\n"))
      expect(result).to eq 5

      result = Adventofcode.part_one("2020", "8")
      expect(result).to eq 1859
    end

    it "day eight part two" do
      input=<<~INPUT
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
INPUT
      result = Adventofcode.part_two("2020", "8", input.split("\n"))
      expect(result).to eq 8

      result = Adventofcode.part_two("2020", "8")
      expect(result).to eq 1235
    end

    it "day nine part one" do
      result = Adventofcode.part_one("2020", "9")
      expect(result).to eq 1930745883
    end

    it "day nine part two" do
      time = Time.new
      result = Adventofcode.part_two("2020", "9")
      runtime = Time.new - time
      puts runtime
      expect(result).to eq 268878261
    end

    it "day ten part one" do

    end
  end
end


