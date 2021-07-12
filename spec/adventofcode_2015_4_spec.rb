RSpec.describe Adventofcode do
  context "2015 day 4" do
    it "example" do
      input = "abcdef"
      result = Adventofcode.part_one("2015", "4", input)
      expect(result).to eq 609043
    end

    it "part one" do
      input = "iwrupvqb"
      result = Adventofcode.part_one("2015", "4", input)
      expect(result).to eq 346386
    end

    it "part two" do
      input = "iwrupvqb"
      result = Adventofcode.part_two("2015", "4", input)
      expect(result).to eq 9958218
    end
  end
end
