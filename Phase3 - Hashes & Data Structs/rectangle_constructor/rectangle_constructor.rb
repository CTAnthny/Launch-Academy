class Rectangle
  def initialize(width, height = nil)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end
