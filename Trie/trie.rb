class Node
  attr_reader :data, :children
  attr_accessor :is_word
  def initialize(data)
    @data = data
    @children = []
    @is_word = false
  end

  def insert(char)
    return get(char) if have?(char)

    child = Node.new(char)
    @children << child
    child
  end

  def have?(char)
    @children.each do |c|
      return true if c.data == char
    end

    false
  end

  def get(char)
    @children.each do |child|
      return child if child.data == char
    end

    false
  end
end

class Trie
  attr_reader :root
  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    node = @root
    word.size.times do |i|
      child = node.insert(word[i])
      node = child
    end
    node.is_word = true
  end

  def search(word)
    node = @root
    word.size.times do |i|
      return false unless node.have?(word[i])
      node = node.get(word[i])
    end

    return node.is_word == true
  end

  def starts_with(word)
    node = @root
    word.size.times do |i|
      return false unless node.have?(word[i])
      node = node.get(word[i])
    end

    return true
  end
end
