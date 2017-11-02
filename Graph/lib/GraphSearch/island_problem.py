class Node:
    def __init__(self, value):
        if value == 1:
            self.filled = True
        else:
            self.filled = False
        self.seen = False

class Graph:
    def __init__(self, grid):
        self.grid = grid
        self.row_n = len(grid)
        self.col_n = len(grid[0])
        self.count = 0
        self.max_count = 0
        self.graph = {}


    def getBiggestRegion(self):
        for row in range(self.row_n):
            for col in range(self.col_n):
                cell = Node(self.grid[row][col])
                self.graph[(row,col)] = cell

        #now iterate over all cells unseen and see if any gets a bigger max_count
        for row in range(self.row_n):
            for col in range(self.col_n):
                if not self.graph[(row,col)].seen:
                    self.DFS(self.graph[(row,col)], (row,col))
                if self.count > self.max_count:
                    self.max_count = self.count
                self.count = 0
        print(self.max_count)


    def DFS(self, node, pos):
        x = pos[0]
        y = pos[1]
        node.seen = True
        if node.filled:
            self.count += 1
            for i in [-1,0,1]:
                for j in [-1,0,1]:
                    if (x+i, y+j) in self.graph:
                        cell = self.graph[(x+i, y+j)]
                        if not cell.seen:
                            self.DFS(cell, (x+i, y+j))
