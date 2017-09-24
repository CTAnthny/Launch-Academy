class StackUnderflow < StandardError
end
class StackOverflow < StandardError
end

class Stack
  def initialize(max_size = 5)
    @contents = []
    @index = 0
    @max_size = max_size
  end

  def push(item)
    if @contents.length == @max_size
      raise StackOverflow
    else
      @contents[@index] = item
      @index += 1
    end
  end

  def peek
    @contents[@index - 1]
  end

  def pop
    raise StackUnderflow if empty?
    @index -= 1
    @contents.pop
  end

  def empty?
    @index == 0
  end
end
