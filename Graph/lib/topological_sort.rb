require_relative 'graph'

# Implementing topological sort using Khan's algorithms
# Don't need to deal with edges if they have no cost

def topological_sort(vertices)
  sorted = []
  queue = []
  vertices.each do |vertex|
    queue.push(vertex) if vertex.in_edges.empty?
  end

  until queue.empty?
    # current = queue.pop?
    current = queue.shift
    sorted << current

    current.out_edges.each do |edge|
      edge.to_vertex.in_edges.delete(edge)
      #check if any of the next vertices have no in edge connections
      if edge.to_vertex.in_edges.empty?
        queue << edge.to_vertex
      end
      # edge.destroy!
    end
  end

  ##check if its not cyclic
  return [] if sorted.length != vertices.length
  sorted
end


##TIME COMPLEXITY:
# O(V + E)
