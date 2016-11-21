=begin
there is a buffer set of an undetermined amount

=end

class CircularBuffer
  def initialize(size)
    @max_buffer_size = size.freeze
    @buffer = []
  end

  def write(item)
    buffer_full? ? raise(BufferFullException) : @buffer.unshift(item).compact!
  end

  def read
    @buffer.pop || raise(BufferEmptyException)
  end

  def write!(item)
    if buffer_full?
      !item.nil? && read || return
      write(item)
    else
      write(item)
    end
  end

  def clear
    @buffer.clear
  end

  private

  def buffer_full?
    @buffer.size == @max_buffer_size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
