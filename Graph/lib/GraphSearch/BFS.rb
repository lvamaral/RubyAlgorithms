# Breadth First Search (BFS): Start at root and explore each neighbor before going down any of the children. Can extend to node.eachChild instead of just checking left and right (in a binary tree)
# Better for finding the shortest path between something.
# Uses a queue to implement it.
# Can be extended in algorithms such as Bidirectional Search, Dijkstra’s Algorithm

def BFS(root)
  return [] if root.nil?
  queue = [root]
  answer = []
  # seen = Set.new
  # seen.add(root)
  until queue.empty?
    node = queue.shift
    answer << node.value
    #would extend this for a non Binary Tree graph
    #Would check if node is not seen before adding to queue
    queue << node.left if node.left
    queue << node.right if node.right
  end
  answer
end
