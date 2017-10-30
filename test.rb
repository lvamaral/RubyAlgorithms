require 'set'
def solution(a)
  # write your code in Ruby 2.2

  #O(n)
  places = Set.new(a)
  total_places = places.count
  seen = []
  #Takes more space to keep a set but saves time in comparing uniques. I prefer trading storage for speed
  vacation_set = Set.new()

  a.each do |place|
    if seen[0] != place
      seen << place
      vacation_set.add(place)
      break if vacation_set.count == total_places
    else
      seen.shift
      seen << place
      break if vacation_set.count == total_places
    end
  end

  #See if we get a better trip on reverse
  prior_length = seen.length
  seen.clear
  vacation_set.clear
  a.reverse_each do |place|
    if seen[-1] != place
      seen.unshift(place)
      vacation_set.add(place)
      break if vacation_set.count == total_places
    else
      seen.pop
      seen.unshift(place)
      break if vacation_set.count == total_places
    end
  end

  return seen.length <= prior_length ? seen.length : prior_length
end

arr = [1,2,3,4,2,5]
p solution(arr)
