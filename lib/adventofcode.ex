defmodule Adventofcode do
  def y2020d1 do
    {:ok, input } = File.read("lib/adventofcode/2020/inputs/1.txt")

    input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
     # |> permutations_of()
      |> Enum.find(fn x -> Enum.sum(x) == 2994 end)
      |> Enum.reduce(&Kernel.*/2)

    # RUBY
        # input.combination(2) do |comb|
        #   int_arr = comb.map(&:to_i)
        #   return int_arr[0] * int_arr[1] if int_arr.sum == 2020
        # end
  end

  def y2017d1p1 do
#    {:ok, input } = File.read("lib/adventofcode/2007/inputs/1.txt")
    input = [1,1,2,2]

    input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
  end
end
