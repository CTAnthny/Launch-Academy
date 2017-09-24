class Exam
  attr_accessor :grade
  def initialize(title, due_date)
    @title = title
    @due_date = due_date
    @assigned_to = nil
    @grade = nil
  end
  def assigned_to=(student)
    @assigned_to = student
  end
end

class Rectangle
  def initialize(length, width, x = 0, y = 0)
    @length = length
    @width = width
    @x = x
    @y = y
  end

  attr_accessor :x
  attr_accessor :y
  attr_reader :length
  attr_reader :width

  def area
    @area = @length * @width
  end

  def diagonal
    Math.sqrt( (@length * @length) + (@width * @width) )
  end

  def move_right
    @x += 1
  end
  def move_up
    @y += 1
  end
  def move_left
    @x -= 1
  end
  def move_down
    @y -= 1
  end

end
