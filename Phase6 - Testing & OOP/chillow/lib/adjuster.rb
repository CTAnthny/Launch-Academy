module Adjuster
  def full?
    if occupants.size < max_capacity
      false
    else
      true
    end
  end

  def add(name)
    if !self.full?
    else
      "It's filled up!"
    end
  end

  def remove
  end
end
