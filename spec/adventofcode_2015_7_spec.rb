RSpec.describe Adventofcode do
  context "2015 day 7" do
    it "part one" do
      result = Adventofcode.part_one("2015", "7")
      expect(result).to eq 3176
    end

    it "part two" do
      result = Adventofcode.part_two("2015", "7")
      expect(result).to eq 14710
    end
  end
end
