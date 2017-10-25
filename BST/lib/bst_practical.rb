require 'binary_search_tree'

def in_order_traversal(tree_node = @root, arr = [])
  if tree_node
    in_order_traversal(tree_node.left, arr)
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right,arr)
    arr
  end
end

def kth_largest(tree_node, k)
  results = kth_largest_search(tree_node, k, arr = [])
end

def kth_largest_search(tree_node, k, arr = [])
  if tree_node
    kth_largest_search(tree_node.right, k, arr)
    return arr[-1] if arr.length == k
    arr.push(tree_node)
    return arr[-1] if arr.length == k
    kth_largest_search(tree_node.left, k, arr)
    return arr[-1] if arr.length == k
    arr
  end
end


def hasPathWithGivenSum(t, s)
   # Return true if we run out of tree and s = 0
    if t.nil? || t.value.nil?
        return s == 0
    else
        # Otherwise check both subtrees
        subSum = s - t.value

        # If we reach a leaf node and sum becomes 0, then
        # return True
        return true if subSum == 0 && (t.left.nil? && t.right.nil?)

        unless t.left.nil?
           ans = hasPathWithGivenSum(t.left, subSum)
           return ans if ans
        end
        unless t.right.nil?
           ans = hasPathWithGivenSum(t.right, subSum)
           return ans if ans
        end
        return false
    end
end

##OR

def hasPathWithGivenSum(t, s)
    return s == 0 if t.nil?
    hasPathWithGivenSum(t.left, s - t.value) || hasPathWithGivenSum(t.right, s - t.value)
end

# /////////////

def isTreeSymmetric(t)
   return true if t.nil?
   return isMirror(t.left,t.right)
end

def isMirror(left,right)
   return true if left.nil? && right.nil?
   return false if left.nil? || right.nil? || left.value != right.value
   isMirror(left.left, right.right) && isMirror(left.right, right.left)
end

#///////
#Check if a binary tree is a BST (where left < parent < right)
def is_valid_bst(root, min = nil, max = nil)
    #base case
    return true if root.nil?

    #make sure that if min is not nil, value is greater than min, and smaller than max (could adapt to allow it to be equal to)
    if !min.nil? && root.val <= min || !max.nil? && root.val >= max
        return false
    end

    #if either left or right are false, return false
    if !is_valid_bst(root.left, min, root.val) || !is_valid_bst(root.right, root.val, max)
        return false
    end

    true
end


def lowest_common_ancestor(root, p, q)
    return root if [nil, p, q].index(root)
    left = lowest_common_ancestor(root.left, p, q)
    right = lowest_common_ancestor(root.right, p, q)
    left && right ? root : left || right
end

# In python, for BT:
# def lowestCommonAncestor(self, root, p, q):
#     if root in (None, p, q): return root
#     left, right = (self.lowestCommonAncestor(kid, p, q)
#                    for kid in (root.left, root.right))
#     return root if left and right else left or right

# IN python, for BST:
# def lowestCommonAncestor(self, root, p, q):
#     """
#     :type root: TreeNode
#     :type p: TreeNode
#     :type q: TreeNode
#     :rtype: TreeNode
#     """
#     while root:
#         """If root is bigger than both, check something smaller(left)"""
#         if p.val < root.val > q.val:
#             root = root.left
#         """If root is smaller than both, check something bigger(right)"""
#         elif p.val > root.val < q.val:
#             root = root.right
#         else:
#             return root

##Takes O(n) time to check each node
##Uses O(log n) space on a balanced tree as we may recurse up to the depth of the tree (log n)

# in JS
# function check(t1, t2) {
#     if (t1 == null && t2 == null) {
#         return true;
#     }
#     if (t1 == null || t2 == null || t1.value != t2.value) {
#         return false;
#     }
#     return check(t1.left, t2.right) && check (t1.right, t2.left);
# }
#
# function isTreeSymmetric(t) {
#     return check(t, t);
# }
