RSpec.describe Adventofcode do
  context "2015 day 3" do
    it "part one" do
      input = []
      result = Adventofcode.part_one("2015", "3", input)
      expect(result).to eq 2565
    end

    it "part two" do
      input = []
      result = Adventofcode.part_two("2015", "3", input)
      expect(result).to eq 2639
    end
  end
end
