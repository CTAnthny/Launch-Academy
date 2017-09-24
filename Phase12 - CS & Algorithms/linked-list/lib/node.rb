class Node
  attr_accessor :info, :next

  def initialize(info, next_node = nil)
    self.info = info
    self.next = next_node
  end

  def next_node
    self.next
  end
end
