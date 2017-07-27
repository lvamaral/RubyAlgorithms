def kth_largest(tree_node, k)
end
# -----------
def hasPathWithGivenSum(t, s)
   # Return true if we run out of tree and s = 0
    if t.nil? || t.value.nil?
        return s == 0
    else
        # Otherwise check both subtrees
        subSum = s - t.value
        p "current sum: #{s}, t.value: #{t.value}"

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
   if left.nil? && right.nil?
      return true
   end
   if !left.nil? && !right.nil?
      if left.value == right.value
         return (isMirror(left.left, right.right) &&
                isMirror(left.right, right.left))
      end
   end
   return false
end

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
