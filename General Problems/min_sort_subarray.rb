#Find the length of the minimum subarray that needs to be sorted to make the whole array sorted.

def min_sort(arr)
  return 0 if arr.length <= 1
  #Starting at the left, find thing that breaks order
  current = arr[0]
  i = 1
  while i < arr.length
    if arr[i] < current
      start_index = i - 1
      break
    end
    current = arr[i]
    i += 1
  end

  #If array is sorted
  return 0 if start_index.nil?

  #Starting at the right, find thing that breaks order
  end_index = start_index+1
  current = arr[-1]
  j = arr.length - 2
  while j > start_index
    if arr[j] > current
      end_index = j + 1
      break
    end
    current = arr[j]
    j -= 1
  end
  candidate_arr = arr[start_index..end_index]
  min = candidate_arr.min
  max = candidate_arr.max

  #find first element in half1 which is greater than min
  arr[0..start_index-1].each_with_index do |el, i|
    if el > min
      start_index = i
      break
    end
  end

  i = arr.length - 1
  while i > end_index+1
    if arr[i] < max
      end_index = i
      break
    end
    i -= 1
  end

  arr[start_index..end_index].length
end

arr = [-1,0,4,3,2,1,7,8,9]
#answer: [4,3,2,1]

arr2 = [10, 15, 20, 30, 25, 40, 35, 45, 50, 60]
##[30, 25, 40, 35]

arr3 = [-1,0,4,3,2,1,7,8,9,-2]
# [-1,0,4,3,2,1,7,8,9,-2]

arr4 = [1]
arr5 = [1,2]
arr6 = [1,3,2]
arr7 = [1,1,1,1,1,-2]


# # p min_sort(arr)
# # p min_sort(arr2)
# # p min_sort(arr3)
# p min_sort(arr7)
# # p min_sort(arr5)
