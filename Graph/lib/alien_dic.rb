require 'set'
class Vertex
    attr_accessor :value, :in_nodes, :out_nodes
    def initialize(value)
        self.value = value
        self.in_nodes = Set.new
        self.out_nodes = Set.new
    end
end

def topo_sort(node_map)
    sorted = []
    queue = []
    node_map.each do |key, vertex|
        queue.push(vertex) if vertex.in_nodes.empty?
    end

    until queue.empty?
        current = queue.shift
        sorted << current.value
        current.out_nodes.each do |node|
            node.in_nodes.delete(current)
            if node.in_nodes.empty?
                queue << node
            end
        end
    end
    return ""  if sorted.length != node_map.keys.length
    sorted.join('')
end

def alien_order(words)
    node_map = {}
    words.each do |word|
        word.chars.each do |ch|
            unless node_map[ch]
                node_map[ch] = Vertex.new(ch)
            end
        end
    end
    i = 0
    while i < words.length - 1
        w1 = words[i]
        w2 = words[i+1]
        add_edges(w1, w2, node_map)
        i += 1
    end
    p topo_sort(node_map)
end

def add_edges(w1, w2, node_map)
    i = 0
    while i < w1.length
        if !w2[i].nil? && w1[i] != w2[i]
            node1 = node_map[w1[i]]
            node2 = node_map[w2[i]]
            node1.out_nodes.add(node2)
            node2.in_nodes.add(node1)
            return
        end
        i+=1
    end
end
arr = ["za","zb","ca","cb"]
alien_order(arr);
