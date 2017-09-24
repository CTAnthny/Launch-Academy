require 'pry'
require_relative 'node'

class LinkedList < Array
  def initialize(*args)
    @head = nil
    if !args.nil?
      args.each do |arg|
        self.prepend(arg)
      end
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
    self.unshift(@head)
  end

  def insert(place, value)
    next_node = self[place]
    new_node = Node.new(value, next_node)
    super(place, new_node)
  end

  def remove(place)
    next_node = self[place + 1]
    self[place - 1].next = next_node
    self.delete_at(place)
  end

  def to_s
    info_list = []
    self.each do |node|
      info_list << node.info
    end
    output = "LinkedList(#{info_list.join(', ')})"
  end
end
