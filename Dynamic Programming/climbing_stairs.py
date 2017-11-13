#BACKTRACKING
# def climbingStaircase(n, k):
#     if k == 0 or n == 0:
#         return [[]]
#     memo = {1: [1]}
#     res = []
#     helper(n, k, [], res)
#     return res
#
# def helper(n, k, current_path, res):
#     if n < 0:
#         return
#     if n == 0:
#         res.append(current_path)
#         return
#     for i in range(1,k+1):
#         if n - i >= 0:
#             current_path2 = current_path[:]
#             current_path2.append(i)
#             helper(n-i, k, current_path2, res)
#         else:
#             break

def climbingStaircase(n, k):
    if n < 0: return []
    if n == 0: return [[]]
    ans = []
    for i in range(1, k+1):
        for seq in climbingStaircase(n-i, k):
            ans.append([i] + seq)
    return ans
