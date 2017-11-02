# Write a function that returns the duplicate number in an array of integers
require 'set'

def find_dup(arr)
  seen = Set.new
  arr.each do |n|
    return n if seen.include?(n)
    seen.add(n)
  end 
end


arr = [1,2,3,4,5,4,6]
p find_dup(arr)
