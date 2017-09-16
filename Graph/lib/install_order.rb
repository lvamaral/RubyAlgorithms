# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'graph'
require_relative 'topological_sort'


def install_order(arr)
  max_id = arr.max_by {|el| el[0]}[0]
  vertices = {}
  (1..max_id).to_a.each do |id|
    vertices[id] = Vertex.new(id)
  end
  
  arr.each do |pack|
    from = vertices[pack[1]]
    to = vertices[pack[0]]
    Edge.new(from, to)
  end
  sorted = topological_sort(vertices.values)
  sorted.map{|v| v.value}
end
