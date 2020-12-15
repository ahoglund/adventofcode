RSpec.describe Adventofcode do
  context "2020 day 15" do
    it "part one" do
      input = [0,3,6]
      result = Adventofcode.part_one("2020", "15", input)
      expect(result).to eq 436

      result = Adventofcode.part_one("2020", "15", [2,0,1,9,5,19])
      expect(result).to eq 1009
    end

    it "part two" do
      result = Adventofcode.part_two("2020", "15", [2,0,1,9,5,19])
      expect(result).to eq 62714
    end
  end
end
