#Given an array, rearrange the array such that :

# If index i is even, arr[i] <= arr[i+1]
# If index i is odd, arr[i] >= arr[i+1]
# Input  : arr[] = {2, 3, 4, 5}
# Output : arr[] = {2, 4, 3, 5}
# #
# Input  :arr[] = {6, 4, 2, 1, 8, 3}
# Output :arr[] = {4, 6, 1, 8, 2, 3}
def weird_sort(arr)
  i = 0
  while i < arr.length - 1
    n1 = arr[i]
    n2 = arr[i+1]
    if i%2==0
      arr[i], arr[i+1] = n2, n1 if n2 < n1
    else
      arr[i], arr[i+1] = n2, n1 if n1 < n2
    end
    i += 1
  end
  p arr
end


arr1 =[2, 3, 4, 5]
arr2 = [6, 4, 2, 1,3, 8, 3, 5]

arr3 = [10, 5, 6, 3, 2, 20, 100, 80]
arr4 = [10, 90, 49, 2, 1, 5, 23]

weird_sort(arr1)
weird_sort(arr4)
