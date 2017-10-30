require_relative 'static_array'

class DynamicArray
  attr_reader :length

 def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
  end

 # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

 # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

 # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    i = @store[@length]
    @length -= 1
    i
  end

 # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)

   if @length == @capacity
      resize!
    end

   @store[@length + 1] = val
    @length += 1
  end

 # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length == 0

   val = @store[0]
    (1...@length).each do |i|
      @store[i - 1] = @store[i]
    end
    @length -= 1
    val
  end

 # O(n): has to shift over all the elements.
  def unshift(val)

   if @length == @capacity
      resize!
    end

   new_store = StaticArray.new(@capacity)
    new_store[0] = val

   i = 1
    while i < @length + 1
      new_store[i] = @store[i - 1]
      i += 1
    end
    @store = new_store
    @length += 1
  end

 protected
  attr_accessor :capacity, :store
  attr_writer :length

 def check_index(index)
    raise 'index out of bounds' unless index < @length && @length >= 0
  end

 # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)
    @length.times do |i|
      new_store[i] = @store[i]
    end
    @capacity = new_capacity
    @store = new_store
  end
end
