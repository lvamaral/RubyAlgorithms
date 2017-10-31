#To make a heap (default is min heap) out of a list: heapq.heapify(list)
#For a max heap: heapq.heapify_max(list)
#MIN HEAP. Has heappush, heappop(heap)

import heapq
listy = [1,2,3]
maxy = heapq._heapify_max(listy)
print(maxy)

myHeap = []
heapq.heappush(myHeap, 2)
heapq.heappush(myHeap, 3)
heapq.heappush(myHeap, 24)
heapq.heappush(myHeap, 21)
heapq.heappush(myHeap, -2)
