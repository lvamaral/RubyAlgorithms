#Keeps track of all swaps done. O(n^2)
def bubble_sort(a)
  swaps = 0
  a.length.times do
      swapped = false
      i = 0
      while i < a.length - 1
          if a[i] > a[i+1]
              a[i], a[i+1] = a[i+1], a[i]
              swapped = true
              swaps += 1
          end
          i += 1
      end
      break unless swapped
  end
  puts swaps
end
