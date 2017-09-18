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

def DFS(t, seen = [])
  seen << t.value
  dfs(node.left, seen) if node.left
  dfs(node.right, seen) if node.right
  seen
end

#################


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

##Sum the numbers of a tree
def digitTreeSum(t)
    seen = []
    numbers = dfs(t, seen)
    sum = 0
    numbers.each do |n|
        sum += n.to_i
    end
    sum
end

def dfs(node, seen, numbers = [])
    seen << node.value
    if node.left.nil? && node.right.nil?
        numbers << seen.join("")
    end

    if node.left
        dfs(node.left, seen.dup, numbers)
    end
    if node.right
        dfs(node.right, seen.dup, numbers)
    end
    numbers
end
