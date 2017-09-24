module Launch
  class QueueIsEmpty < StandardError
  end

  class Queue
    def initialize
      @list = Array.new
    end

    def enter(element)
      @list << element
    end

    def leave
      raise QueueIsEmpty if empty?
      @list.shift
    end

    def peek
      @list[0]
    end

    def count
      count = {}
      @list.each do |elem|
        count[elem].nil? ? count[elem] = 1 : count[elem] += 1
      end
      count
    end

    def empty?
      @list.length == 0
    end
  end
end
