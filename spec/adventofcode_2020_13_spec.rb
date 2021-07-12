RSpec.describe do
  context "2020 day 13" do
    it "part one" do
      input = "939\n7,13,x,x,59,x,31,19"
      result = Adventofcode.part_one("2020", "13", input.split("\n"))
      expect(result).to eq 295

      result = Adventofcode.part_one("2020", "13")
      expect(result).to eq 4808
    end

    it "part two" do
      # input = "000\n17,x,13,19"
      # result = Adventofcode.part_two("2020", "13", input.split("\n"))
      # expect(result).to eq 3417

      # input = "000\n67,7,59,61"
      # result = Adventofcode.part_two("2020", "13", input.split("\n"))
      # expect(result).to eq 754018

      # input = "000\n67,x,7,59,61"
      # result = Adventofcode.part_two("2020", "13", input.split("\n"))
      # expect(result).to eq 779210

      # input = "939\n7,13,x,x,59,x,31,19"
      # result = Adventofcode.part_two("2020", "13", input.split("\n"))
      # expect(result).to eq 1068781

      result = Adventofcode.part_two("2020", "13")
      expect(result).to eq 1068781
    end
  end
end
