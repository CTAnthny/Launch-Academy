
class Rectangle
  attr_reader :length, :width
  attr_accessor :x, :y

  def initialize(length, width, x = 0, y = 0)
    @length = length
    @width = width
    @x = x
    @y = y
  end

  def area
    @length * @width
  end

  def diagonal
    z = @length ** 2 + @width ** 2
    Math::sqrt(z)
  end

  def move_right(dx = 1)
    @x += dx
  end

  def move_up(dy = 1)
    @y += dy
  end

  def move_left
    move_right(-1)
  end

  def move_down
    move_up(-1)
  end
end
