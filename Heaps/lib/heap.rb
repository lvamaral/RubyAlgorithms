require 'byebug'
class BinaryMinHeap
   def initialize(&prc)

     @store = []
     @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
   end

   def count
     @store.count
   end

   def extract
     raise "no element to extract" if count == 0

     val = @store[0]

     if count > 1
       @store[0] = @store.pop
       self.class.heapify_down(@store, 0, &prc)
     else

       @store.pop
     end

     val
   end

   def peek
      raise "no element to peek" if count == 0
      @store[0]
   end

   def push(val)
     @store << val
     self.class.heapify_up(@store, self.count - 1, &prc)
  end

   protected
   attr_accessor :prc, :store

   public
   def self.child_indices(len, parent_index)
     children = []
     child1 = 2 * parent_index + 1 if 2 * parent_index + 1 < len
     child2 = 2 * parent_index + 2 if 2 * parent_index + 2 < len

     children << child1 if child1
     children << child2 if child2

     children

   end

   def self.parent_index(child_index)
     raise "root has no parent" if child_index == 0
     return (child_index - 1) / 2
   end

  #  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  #    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
  #    children_idx = BinaryMinHeap.child_indices(len, parent_idx)
  #    child1 = array[children_idx[0]]
  #    child2 = array[children_idx[1]] if children_idx[1]
   #
  #    loop do
  #       if child1 && prc.call(array[parent_idx], child1) > 0
  #        array[parent_idx], array[children_idx[0]] = array[children_idx[0]], array[parent_idx]
  #        parent_idx, children_idx[0] = children_idx[0], parent_idx
   #
  #        children_idx = BinaryMinHeap.child_indices(len, parent_idx)
  #        child1 = array[children_idx[0]] if children_idx[0]
  #        child2 = array[children_idx[1]] if children_idx[1]
   #
  #      elsif child2 && prc.call(array[parent_idx], child2) > 0
  #        array[parent_idx], array[children_idx[1]] = array[children_idx[1]], array[parent_idx]
  #        parent_idx, children_idx[1] = children_idx[1], parent_idx
   #
  #        children_idx = BinaryMinHeap.child_indices(len, parent_idx)
  #        child1 = array[children_idx[0]] if children_idx[0]
  #        child2 = array[children_idx[1]] if children_idx[1]
  #      end
   #
  #     result1 = prc.call(array[parent_idx], child1)
  #     result2 = prc.call(array[parent_idx], child2)
  #     if children_idx.empty?
  #       if result1.nil? || result1 <= 0
  #         if result2.nil? || resul2 <= 0
  #           break
  #         end
  #       end
  #     end
  #    end
  #    array
  #  end
  
    def self.heapify_down(array, parent_idx, len = array.length, &prc)
       prc ||= Proc.new { |el1, el2| el1 <=> el2 }

       l_child_idx, r_child_idx = child_indices(len, parent_idx)

       parent_val = array[parent_idx]

       children = []
       children << array[l_child_idx] if l_child_idx
       children << array[r_child_idx] if r_child_idx

       if children.all? { |child| prc.call(parent_val, child) <= 0 }
         return array
       end

       swap_idx = nil
       if children.length == 1
         swap_idx = l_child_idx
       else
         swap_idx =
           prc.call(children[0], children[1]) == -1 ? l_child_idx : r_child_idx
       end

       array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
       BinaryMinHeap.heapify_down(array, swap_idx, len, &prc)
   end


   def self.heapify_up(array, child_idx, len = array.length, &prc)
     return array if child_idx == 0
     prc ||= Proc.new { |el1, el2| el1 <=> el2 }
     parent_idx = BinaryMinHeap.parent_index(child_idx)
     while child_idx != 0 && prc.call(array[parent_idx], array[child_idx]) > 0
         array[parent_idx], array[child_idx] =  array[child_idx], array[parent_idx]
         child_idx = parent_idx
         break if child_idx == 0
         parent_idx = BinaryMinHeap.parent_index(child_idx)
     end
     array
   end
 end
