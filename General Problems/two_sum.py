#Given an array of numbers, and a sum, find the index of two numbers that add to the sume
def two_sum(k,a):
    costs = {}
    for i in range(len(a)):
        cost = a[i]
        remainder = k - cost
        #if remainder already in costs, means our current index is higher than what was already considered
        if remainder in costs:
            print(costs[remainder], i)
            break
        costs[cost] = i
