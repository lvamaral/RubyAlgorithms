# Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
#
# Each number in C may only be used once in the combination.
#
# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8,
# A solution set is:
# [
#   [1, 7],
#   [1, 2, 5],
#   [2, 6],
#   [1, 1, 6]
# ]

class Solution
  attr_accessor :response
  def initialize(options,target)
    self.response = []
    options.sort!
    DFS(target, [], options)
  end

  def DFS(target, current_path, options)
    if target == 0
      @response << current_path if !@response.include?(current_path)
      return
    end
    return  if target < 0
    (0...options.length).each do |i|
        option = options[i]
        remainder = target-option
        new_path = current_path.dup.push(option)
        DFS(remainder, new_path, options[i+1..-1]) if remainder >= 0 && options[i+1..-1]
    end
  end
end

def combination_sum2(candidates, target)
    Solution.new(candidates, target).response
end

arr =  [10, 1, 2, 7, 6, 1, 5]
target = 8

p combination_sum2(arr,target)
