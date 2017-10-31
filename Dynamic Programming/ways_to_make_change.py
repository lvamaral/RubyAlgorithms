# Print a single integer denoting the number of ways we can make change for n dollars using an infinite supply of "coins" types of coins.

def make_change(coins, n, index = 0, memo = {}):
    if n == 0:
        return 1
    if index >= len(coins):
        return 0

    #Save the current amount being considered and the coin to keep track of the "stage" of the process
    key = str(n)+"-"+str(index)
    if key in memo:
        return memo[key]

    amtWithCoin = 0
    ways = 0
    while amtWithCoin <= n:
        remainder = n - amtWithCoin
        ways += make_change(coins, remainder, index+1, memo)
        amtWithCoin += coins[index]
    memo[key] = ways
    return ways


coins = [2,5,3,6]
n = 10
print(make_change(coins,n))
#5


#Solution is basically creating a tree of possibilities. For each coin, considering all the possibilities if 1 coin was used, or 2, or 3... untill there's no more possible (amt>n)
