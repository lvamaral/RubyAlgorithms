def dup(arr):
    seen = set()
    for n in arr:
        if n in seen:
            return n
        else:
            seen.add(n)



arr = [1,2,3,4,5,4,6]
print(dup(arr))
