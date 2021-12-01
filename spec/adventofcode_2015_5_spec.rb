RSpec.describe Adventofcode do
  context "2015 day 5" do
    it "part one" do
      input = ["ugknbfddgicrmopn", "aaa"]
      result = Adventofcode.part_one("2015", "5", input)
      expect(result).to eq 2
    end

    it "part two" do
      input = []
      result = Adventofcode.part_two("2015", "5", input)
      expect(result).to eq 0
    end
  end
end
