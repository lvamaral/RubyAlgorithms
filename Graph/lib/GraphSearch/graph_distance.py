class Node:
    def __init__(self, n):
        self.value = n
        self.connections = []

class Graph:
    def __init__(self, n):
        self.nodes = []
        self.distances = [-1]*n
        for i in range(n):
            node = Node(i+1)
            self.nodes.append(node)

    def connect(self, from_i, to_i):
        from_node = self.nodes[from_i-1]
        to_node = self.nodes[to_i-1]
        from_node.connections.append(to_node)
        to_node.connections.append(from_node)

    def find_all_distances(self, start):
        start_node = self.nodes[start]
        self.BFS(start_node)
        self.distances.remove(0)
        print(" ".join(map(str,self.distances)))



    def BFS(self, start):
        queue = [(start,0)]
        seen = set()
        seen.add(start.value)
        while queue:
            top = queue.pop(0)
            current_node = top[0]
            cost = top[1]
            self.distances[current_node.value-1] = cost
            cost += 6
            for new_node in current_node.connections:
                if new_node.value not in seen:
                    seen.add(new_node.value)
                    queue.append((new_node, cost))
