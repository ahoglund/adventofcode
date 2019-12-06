input = File.readlines('3.input').map(&:chomp)

# ret: [x, y]
def process_coords(raw_coords)
  raw_coords.split(":").first.split(",").map(&:to_i)
end

# ret: [w, h]
def process_size(raw_size)
  raw_size.split("x").map(&:to_i)
end

def print_fl(str)
  print str
  $stdout.flush
end

fabric         = []
taken_inches   = 0
fabric_h       = 1000
fabric_w       = 1000
expected_taken = 103482
pure_claims = {}

fabric_w.times do
  row = []
  fabric_h.times do
    row << nil
  end
  fabric << row
end

input.each do |item|
  details  = item.split(" ")
  claim_id = details[0]
  x_y      = process_coords(details[2])
  w_h      = process_size(details[3])
  pure_claims[claim_id] = 1

  w_h.first.times do |w|
    w_h.last.times do |h|
      if fabric[x_y.last + h][x_y.first + w] == 'X'
        pure_claims[claim_id] = 0
        next
      end
      if fabric[x_y.last + h][x_y.first + w]
        taken_inches += 1
        pure_claims[claim_id] = 0
        pure_claims[fabric[x_y.last + h][x_y.first + w]] = 0
        fabric[x_y.last + h][x_y.first + w] = 'X'
      else
        fabric[x_y.last + h][x_y.first + w] = claim_id
      end
    end
  end
end


puts expected_taken == taken_inches

# PART TWO
# what is the claim_id of the only one that doesn't overlap

puts pure_claims.map { |k,v| k if v == 1 }.compact.first == "#686"
