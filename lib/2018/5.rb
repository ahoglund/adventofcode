UPPERS = ("A".."Z").to_a
LOWERS = ("a".."z").to_a

def reacts(a, b)
  # true if a is upper and b is lower and both have the same index
  # true if a is lower and b is upper and both have the same index
  return true if (UPPERS.include?(a) && LOWERS.include?(b) && UPPERS.index(a) == LOWERS.index(b))
  return true if (UPPERS.include?(b) && LOWERS.include?(a) && UPPERS.index(b) == LOWERS.index(a))
  false
end

input = File.readlines("5.input").map(&:chomp).first.split("")

def react(input,  new_stack = [])
  while(input.length > 0) do
    if reacts(new_stack.last, input.first)
      new_stack.pop
      input.shift
    else
      new_stack << input.shift
    end
  end

  new_stack.count
end

puts react(input.dup) == 9526

#PART TWO

counts = []
LOWERS.each_with_index do |_, i|
  n_input = input.dup
  n_input.delete(LOWERS[i])
  n_input.delete(UPPERS[i])
  counts << react(n_input)
end

puts counts.min == 6694
