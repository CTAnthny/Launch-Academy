class Cage
  attr_accessor :animal

  def empty?
    if animal.nil?
      true
    else
      false
    end
  end
end
