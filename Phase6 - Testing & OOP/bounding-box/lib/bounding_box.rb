class BoundingBox
  attr_accessor :left, :bottom, :width, :height
  attr_reader :right, :top

  # think:
  # -> x-axis:
  # (left, 0)  x = left  &  y = 0
  # (right, 0)  x = left + width  &  y = 0
  #
  # -> y-axis:
  # (0, bottom)  x = 0  &  y = bottom
  # (0, top)  x = 0  &  y = bottom + height

  def initialize(left, bottom, width, height)
    @left = left
    @bottom = bottom
    @right = left + width
    @top = bottom + height
    @width = width
    @height = height
  end

  def contains_point?(x, y)
    true_array = []

    # push 1 to array if box contains x coordinate
    if x >= @left && x <= @right
      true_array << 1
    end

    # push 1 to array if box contains y coordinate
    if y >= @bottom && y <= @top
      true_array << 1
    end

    # if [1, 1], box contains point
    true_array.count(1) == 2
  end
end
