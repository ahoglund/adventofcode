RSpec.describe Adventofcode do
  context "2015 day 5" do
    it "part one" do
      input = ["ugknbfddgicrmopn", "aaa", "jchzalrnumimnmhp", "haegwjzuvuyypxyu", "dvszwmarrgswjxmb", "ixaa", "aaxi"]
      result = Adventofcode.part_one("2015", "5", input)
      expect(result).to eq 4

      result = Adventofcode.part_one("2015", "5")
      expect(result).to eq 238
    end

    it "part two" do
      input = %w{ qjhvhtzxzqqjkmpb xxyxx uurcxstgmygtbstg ieodomkazucvgmuy }
      # result = Adventofcode.part_two("2015", "5", input)
      # expect(result).to eq 2

      result = Adventofcode.part_two("2015", "5")
      expect(result).to eq 100
    end
  end
end
