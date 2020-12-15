RSpec.describe Adventofcode do
  context "2020 day 14" do
    it "part one" do
      input=<<~INPUT
mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0
INPUT
      result = Adventofcode.part_one("2020", "14", input.split("\n"))
      expect(result).to eq 165

      result = Adventofcode.part_one("2020", "14")
      expect(result).to eq 18630548206046
    end

    it "part two" do
      input = []
      result = Adventofcode.part_two("2020", "14", input)
      expect(result).to eq 208
    end
  end
end
