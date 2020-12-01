input = File.readlines("8.input").map(&:chomp)
items = input.first.split(" ").map(&:to_i)

require 'pry'
# PART ONE
# metadata = []
# stack    = []
# # iterative
# until items.empty?
#   if !stack.empty? && stack.last[0] == 0
#     stack.last[1].times do
#       metadata << items.shift
#     end
#     stack.pop
#     stack.last[0] -= 1 unless stack.empty?
#   else
#     stack << items.shift(2)
#   end
# end

# puts metadata.sum

# PART TWO
# If a node has no child nodes, its value is the sum of its metadata entries

# 2. nodes with children then need to get the some of each child referenced by
#    the index in the metadata entry



class Node
  attr_accessor :num_children, :num_metadata, :processed, :root

  def initialize(num_children, num_metadata)
    @num_children = num_children
    @num_metadata = num_metadata
    @metadata = []
    @children = []
    @root = false
    @processed = false
  end

  def has_children?
    num_children > 0
  end

  def add_metadata(metadata)
    raise "NO MORE METADATA!" if @metadata == num_metadata
    @metadata << metadata
  end

  def add_child(child)
    raise "NO MORE CHILDREN!" if @children == num_children
    @children << child
  end

  def children_referenced_with_index
    @metadata.each_with_object([]) do |index, refed_children|
      refed_children << @children[index - 1] if @children[index - 1]
    end
  end

  def value
    return @metadata.inject(0, :+) unless has_children?

    sum = 0
    children_referenced_with_index.each do |child|
      sum += child.value
    end
    sum
  end
end

# 2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2
# A----------------------------------
#     B----------- C-----------
#                      D-----

items = %w[2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2].map(&:to_i)
root_node_val = 0
current_parent = nil
stack = []

def process_node(node, items)
    node.num_metadata.times do
      node.add_metadata(items.shift)
    end
    node.processed = true
end

until items.empty?
  if !stack.empty? && !stack.last.has_children?
    process_node(stack.last, items)
    stack.pop
    stack.last[0] -= 1 unless stack.empty?
  else
    node = Node.new(items.shift, items.shift)
    stack << node
  end
end
# until items.empty?
#   node = Node.new(items.shift, items.shift)
#   @nodes << node

#   if !node.has_children?
#     process_node(node, items)
#     root_node_val += node.value
#   else
#     if current_parent
#       current_parent.add_child(node)
#     else
#       node.root = true
#     end

#     current_parent = node
#   end
# end

puts root_node_val
