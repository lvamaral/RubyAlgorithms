class MyQueue(object):
    def __init__(self):
        self.stackNewest = []
        self.stackOldest = []

    def shiftStacks(self):
        if len(self.stackOldest)==0:
            while self.stackNewest:
                self.stackOldest.append(self.stackNewest.pop())

    def peek(self):
        self.shiftStacks()
        return self.stackOldest[0]

    #O(n), just like using unshift. Has to pass all values to oldest from newest
    def dequeue(self):
        self.shiftStacks()
        return self.stackOldest.pop()


    def enqueue(self, value):
        self.stackNewest.append(value)
