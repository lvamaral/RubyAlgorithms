require_relative 'heap'

def k_largest_elements(array, k)
  maxHeap = BinaryMinHeap.new{ |el1, el2| el2 <=> el1 }
  n = array.length
  (n-k).times do
    top = array.shift
    maxHeap.push(top)
  end
  largest = []
  k.times do
    top = array.shift
    maxHeap.push(top)
    largest << maxHeap.extract
  end
  largest
end
