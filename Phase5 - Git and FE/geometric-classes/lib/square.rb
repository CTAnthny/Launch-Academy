class Square
  attr_accessor :length, :width, :x, :y

  def initialize(length, x = 0, y = 0)
    @length = length
    @width = length
    #x position of centerpoint
    @x = x
    #y position of centerpoint
    @y = y
  end

  def diameter
    @diameter = Math.sqrt(2) * @length
  end

  def perimeter
    @perimeter = @length * 4
  end

  def area
    @area = @length ** 2
  end

  def contains_point?(x, y)
    coordinates = []
    half_length = @length / 2.0
    # possible x range
    if x.between?((@x - half_length), (@x + half_length))
    # equivalent (x >= (@x - half_length) && x <= (@x + half_length))
      coordinates << x
    end
    # possible y range
    if y.between?((@y - half_length), (@y + half_length))
    # equivalent (y >= (@y - half_length) && y <= (@y + half_length))
      coordinates << y
    end
    coordinates[0] == x && coordinates[1] == y
  end
end
