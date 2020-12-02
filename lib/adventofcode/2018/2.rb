ids = File.readlines("2.input").map(&:chomp)

# PART ONE
two   = 0
three = 0

ids.each do |id|
  id_ary = id.split('')
  counts_for_two = false
  counts_for_three = false

  id_ary.each_with_object(Hash.new(0)) do |i,acc|
    acc[i] += 1
    counts_for_two = true if acc[i] == 2
    counts_for_three = true if acc[i] == 3
  end

  two += 1 if counts_for_two
  three += 1 if counts_for_three
end

puts two * three == 5750

require 'set'
winner = Set.new

# PART TWO
ids.each_with_index do |id1, ix1|
  ids.each_with_index do |id2, ix2|
    next unless id1.length == id2.length
    next if id1 == id2
#    next if searched.include?("#{ix1}#{ix2}")
    (0..(id1.length - 1)).each do |i|
      str1 = String.new(id1)
      str2 = String.new(id2)
      str1[i] = 'X'
      str2[i] = 'X'
      if str1 == str2
        winner.add(str1.delete(str1[i]))
      end
    end
  end
end

puts winner.first == "tzyvunogzariwkpcbdewmjhxi"
