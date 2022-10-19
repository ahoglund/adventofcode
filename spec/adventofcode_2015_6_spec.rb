RSpec.describe Adventofcode do
  context "2015 day 6" do
    it "part one" do
      input = [
        "turn on 0,0 through 999,999",
        "toggle 0,0 through 999,0",
        "turn off 449,449 through 500,500",
      ]
      result = Adventofcode.part_one("2015", "6", input)
      expect(result).to eq 996296

      result = Adventofcode.part_one("2015", "6")
      expect(result).to eq 400410
    end

    it "part two" do
      result = Adventofcode.part_two("2015", "6")
      expect(result).to eq 0
    end
  end
end
