require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0
    @store = StaticArray.new(8)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    val, self[@length-1] = self[@length - 1], nil
    @length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
   if @length == @capacity
      resize!
    end
    @length += 1
    self[@length - 1] = val

  end

  # O(1)
  def shift
    raise 'index out of bounds' if @length == 0

  val, self[0] = self[0], nil
   @start_idx = (@start_idx + 1) % @capacity
  @length -= 1
   val
   #
  #  val = @store[0]
  #   (1...@length).each do |i|
  #     @store[i - 1] = @store[i]
  #   end
  #   @length -= 1
  #   val
  end

  # O(1) ammortized
  def unshift(val)

    if @length == @capacity
      resize!
    end


    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    self[0] = val

  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' unless index < @length && @length >= 0
  end

  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)
    @length.times do |i|
      new_store[i] = self[i]
    end
    @start_idx = 0
    @capacity = new_capacity
    @store = new_store
  end
end
