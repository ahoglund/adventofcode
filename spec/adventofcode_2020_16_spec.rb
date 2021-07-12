RSpec.describe Adventofcode do
  context "2020 day 16" do
    it "part one" do
      input=<<~INPUT
class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12
INPUT
      result = Adventofcode.part_one("2020", "16", input.split("\n\n"))
      expect(result).to eq 71

      result = Adventofcode.part_one("2020", "16")
      expect(result).to eq 26869
    end

    it "part two" do
      input=<<~INPUT
class: 0-1 or 4-19
row: 0-5 or 8-19
seat: 0-13 or 16-19

your ticket:
  11,12,13

nearby tickets:
3,9,18
15,1,5
5,14,9
INPUT
      # result = Adventofcode.part_two("2020", "16", input.split("\n\n"))
      # expect(result).to eq({ "class" => 12, "row" => 11, "seat" => 13 })

      result = Adventofcode.part_two("2020", "16")
      expect(result).to eq({ "class" => 12, "row" => 11, "seat" => 13 })
    end
  end
end
