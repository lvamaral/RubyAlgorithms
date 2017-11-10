#USES BACKTRACKING
# Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
# The same repeated number may be chosen from C unlimited number of times.
# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [2, 3, 6, 7] and target 7,
# A solution set is: [[7] , [2, 2, 3]]

class Solution
  attr_accessor :response
  def initialize(options,target)
    self.response = []
    options.sort! #might be unecessary
    DFS(target, [], options)
  end

  def DFS(target, current_path, options)
    if target == 0
      @response << current_path
      return
    end
    return if target < 0
    options.each_with_index do |option, i|
      remainder = target-option
      new_path = current_path.dup.push(option)
      DFS(remainder, new_path, options[i..-1]) if remainder >= 0
    end
  end
end

# arr = [2, 3, 6, 7]
# tar get = 7

arr = [2,5,3,6]
target = 10
p Solution.new(arr, target).response
