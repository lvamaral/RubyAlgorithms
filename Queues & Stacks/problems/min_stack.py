#Min stack by having two stacks.
class MinStack(object):
    def __init__(self):
        self.stack = []
        self.mins = []

    def push(self, x):
        self.stack.append(x)
        #self.mins keeps track of all the mins. Adds a new one if there's none, or a new one if its smaller than the current min.
        if len(self.mins) == 0 or x <= self.mins[-1]:
            self.mins.append(x)

    def pop(self):
        value = self.stack.pop()
        #If the popped value was also a min, remove it from the min stack.
        if value == self.mins[-1]:
            self.mins.pop()
        return value

    def top(self):
        return self.stack[-1]

    def getMin(self):
        return self.mins[-1]

#OR keeping track of curMin for every stage. This wastes more space though.
class MinStack:

def __init__(self):
    self.q = []

# @param x, an integer
# @return an integer
def push(self, x):
    curMin = self.getMin()
    if curMin == None or x < curMin:
        curMin = x
    self.q.append((x, curMin));

# @return nothing
def pop(self):
    self.q.pop()


# @return an integer
def top(self):
    if len(self.q) == 0:
        return None
    else:
        return self.q[len(self.q) - 1][0]


# @return an integer
def getMin(self):
    if len(self.q) == 0:
        return None
    else:
        return self.q[len(self.q) - 1][1]
