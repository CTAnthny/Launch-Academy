require_relative "bounding_box"

class BoundingArea
  attr_accessor :boxes_array

  def initialize(boxes_array)
    @boxes_array = boxes_array
  end

  # returns true if the given coordinate is contained within any of the boxes
  def boxes_contain_point?(x, y)
    true_array = []

    if @boxes_array == nil || @boxes_array == []
      false
    else
      # for each box, add 1 to true_array if box contains point
      @boxes_array.each do |bounding_box|
        if bounding_box.contains_point?(x, y)
          true_array << 1
        end
      end

      # if there is a 1 in the array, the point is in a box
      true_array.include?(1)
    end
  end
end
