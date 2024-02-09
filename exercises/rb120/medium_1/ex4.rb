# class CircularBuffer
#   attr_accessor :buffer, :next_index, :oldest_index

#   def initialize(size)
    # @buffer = Array.new(size)
#     @next_index = 0
#     @oldest_index = []
#   end

#   def put(num)
#     oldest_index.shift unless buffer[next_index].nil?
#     buffer[next_index] = num
#     oldest_index << next_index
#     increment_curent_index
#   end

#   def get
#     return nil if oldest_index.empty?
#     num = buffer[oldest_index.first]
#     buffer[oldest_index.first] = nil
#     oldest_index.shift
#     num
#   end

#   private

#   def increment_curent_index
#     @next_index = (next_index + 1) % buffer.size
#   end
# end

class CircularBuffer
  attr_accessor :buffer
  attr_reader :max_size

  def initialize(size)
    @buffer = Array.new
    @max_size = size
  end

  def put(num)
    buffer << num
    buffer.shift if buffer.size > max_size
  end

  def get
    buffer.shift
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1
buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil
