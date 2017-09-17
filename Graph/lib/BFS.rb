def BFS(t)
  return [] if t.nil?
  queue = [t]
  answer = []
  until queue.empty?
    top = queue.shift
    answer << top.value

    queue << node.left if node.left
    queue << node.right if node.right
  end
  answer
end


#Find largest value in each row
def largestValuesInTreeRows(t)
    return [] if t.nil?
    queue = [t]
    largest = []
    until queue.empty?
        max = queue.map{|n| n.value}.max
        largest << max
        temp = []
        queue.each do |node|
            temp << node.left if node.left
            temp << node.right if node.right
        end
        queue = temp
    end
    largest
end
