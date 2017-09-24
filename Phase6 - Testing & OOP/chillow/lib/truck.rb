require_relative "../spec/spec_helper.rb"

class Truck
  include Adjuster
  attr_reader :box_capacity, :boxes_held

  def initialize(box_capacity)
    @box_capacity = box_capacity
    @boxes_held = []
  end

  # def full?
  #   if @boxes_held.size < @box_capacity
  #     false
  #   else
  #     true
  #   end
  # end
  #
  # def add_box(owner_name)
  #   if !self.full?
  #     @boxes_held << Box.new(owner_name)
  #   else
  #     "The truck is full!"
  #   end
  # end
  #
  # def remove_box
  #   @boxes_held.shift
  # end

  def unload_boxes!(owner_name)
    @boxes_held.delete_if { |box| box.owner_name == owner_name }
  end
end
