RSpec.describe Adventofcode do
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
  end
end
