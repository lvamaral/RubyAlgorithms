require 'bst_node'
require 'byebug'
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
    elsif node.left && node.right
      r = maximum(node.left)

      ##re-asigns parent's pointers
      parent = node.parent
      parent.left == node ? parent.left = r : parent.right = r

      ##changes r's left pointers
      #but first promote it's left child to take its place
      if r.left
        child = r.left
        r.parent.left == r ? r.parent.left = child : r.parent.right = child
        child.left = r.left
        child.right = r.right
      end

      r.left = node.left
      node.left.parent = r

      ##changes r's right pointers
      r.right = node.right
      node.right.parent = r

    else
      if node.left
        new_node = node.left
        node.parent.left = new_node
        new_node.parent = node.parent.left
      else
        new_node = node.right
        node.parent.right = new_node
        new_node.parent = node.parent.right
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil?
      return tree_node
    else
      return maximum(tree_node.right)
    end
  end

  def depth(tree_node = @root)
    depth = 0
    if tree_node.nil? || tree_node.left.nil? && tree_node.right.nil?
      return depth
    else
      depth += 1
      return depth + [depth(tree_node.left), depth(tree_node.right)].max
    end
  end

  def is_balanced?(tree_node = @root)
    # return false if tree_node.nil?
    if tree_node.left
      left_depth = depth(tree_node.left)
    else
      left_depth = 0
    end

    if tree_node.right
      right_depth = depth(tree_node.right)
    else
      right_depth = 0
    end

    if (right_depth - left_depth).abs > 1
      return false
    elsif tree_node.right && tree_node.left
      return is_balanced?(tree_node.right) && is_balanced?(tree_node.left)
    else
      if tree_node.right
        return is_balanced?(tree_node.right)
      elsif tree_node.left
        return is_balanced?(tree_node.left)
      end
      return true
    end
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
