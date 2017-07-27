require 'bst_node'
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)
    if !@root
      nil
    else
      BinarySearchTree.find!(@root, value)
    end
  end

  def delete(value)
    node = self.find(value)
    if node == @root
      @root = nil
    elsif node.nil?
      nil
    elsif !node.left && !node.right
      node.parent.right == node ? node.parent.right = nil : node.parent.left = nil
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  def self.find!(node, value)
    return node if node.value == value
    if value <= node.value
      return BinarySearchTree.find!(node.left, value) if node.left
      nil
    elsif value > node.value
      return BinarySearchTree.find!(node.right, value) if node.right
      nil
    end
  end

  def self.insert!(node,value)
    if value <= node.value
      if node.left
        BinarySearchTree.insert!(node.left, value)
      else
        node.left = BSTNode.new(value)
        node.left.parent = node
      end
    elsif value > node.value
      if node.right
        BinarySearchTree.insert!(node.right, value)
      else
        node.right = BSTNode.new(value)
        node.right.parent = node
      end
    end
  end
end
