input = File.readlines("7.input").map(&:chomp)

deps = {}
input.each do |item|
  s_item = item.split
  deps[s_item[7]] ||= []
  deps[s_item[1]] ||= []
  deps[s_item[7]] << s_item[1]
end

ans = ''
until deps.empty?
  next_dep = deps.select { |k,v| v.empty? }.keys.sort[0]
  deps.delete(next_dep)
  deps.each { |k,v| v.delete(next_dep) }

  ans += next_dep
end

puts ans

# PART TWO
