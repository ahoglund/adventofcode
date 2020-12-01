day = __FILE__.split(".").first
input = File.read("../inputs/#{day}.txt").split("\n")

# 1
#
wrapping_paper = 0
ribbon = 0
input.each do |dimensions|
  l, w, h = dimensions.split("x").map(&:to_i)
  area1   = (2 * (l * w))
  area2   = (2 * (w * h))
  area3   = (2 * (h * l))
  extra   = [area1, area2, area3].min / 2
  needed  = [area1, area2, area3, extra].sum

  wrapping_paper += needed

# 2
  gwell = [l,w,h]
  bwell = []

  2.times do
    bwell << gwell.min
    gwell.delete_at(gwell.index(bwell.last))
  end

  ribbon_needed = bwell.map {|i| i + i }.sum
  bow_needed    = l * w * h

  ribbon += (ribbon_needed + bow_needed)
end

puts wrapping_paper
puts ribbon
