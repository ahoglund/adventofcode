input = File.read("../inputs/2.txt").split(",").map(&:to_i)
#
#memory = "1,9,10,3,2,3,11,0,99,30,40,50".split(",").map(&:to_i)

memory = input.dup
memory[1] = 12
memory[2] = 2

# 1
memory.each_slice(4) do |instruction|
  if instruction[0] == 1
    memory[instruction[3]] = memory[instruction[1]] + memory[instruction[2]]
  elsif instruction[0] == 2
    memory[instruction[3]] = memory[instruction[1]] * memory[instruction[2]]
  elsif instruction[0] == 99
    puts memory.first
  end
end

# 2
(0..(input.length - 1)).to_a.each do |noun|
  (0..(input.length - 1)).to_a.each do |verb|
    memory = input.dup
    memory[1] = noun
    memory[2] = verb

    memory.each_slice(4) do |instruction|
      if instruction[0] == 1
        memory[instruction[3]] = memory[instruction[1]] + memory[instruction[2]]
      elsif instruction[0] == 2
        memory[instruction[3]] = memory[instruction[1]] * memory[instruction[2]]
      elsif instruction[0] == 99
        if memory.first == 19690720
          puts 100 * noun + verb
          exit
        end
      end
    end
  end
end

# 1

