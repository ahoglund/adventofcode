day = __FILE__.split(".").first
input = File.read("../inputs/#{day}.txt").split("\n")

orbits = Hash.new()

until input.empty?
  parent, child = input.shift.split(")")
  if orbits[child]
    orbits.each do |k,v|
      next unless v.index(child)
      v.push(parent)
      if orbits[parent]
        orbits[parent].each do |anc|
          v.push(anc)
        end
      end
    end
  end

  orbits[parent] ||= []
  orbits[child] = [parent] | orbits[parent]
end

#1
puts(orbits.values.inject(0) { |total, v| total += v.length })

#2
puts((orbits['YOU'] - orbits['SAN']).length + (orbits['SAN'] - orbits['YOU']).length)

