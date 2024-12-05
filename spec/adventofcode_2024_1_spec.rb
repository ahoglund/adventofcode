RSpec.describe Adventofcode do
  context '2024 day 1' do
    it 'part one' do
      # input = <<~INPUT
      #   3   4
      #   4   3
      #   2   5
      #   1   3
      #   3   9
      #   3   3
      # INPUT

      result = Adventofcode.part_one('2024', '1')
      expect(result).to eq 2_904_518
    end

    it 'part two' do
      input = <<~INPUT
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
      INPUT

      result = Adventofcode.part_two('2024', '1', input)
      expect(result).to eq 18_650_129
    end
  end
end
