class Person
  def initialize(first_name, last_name = nil, middle_name = nil)
    if last_name.nil?
      name = first_name.split(" ")
      if name.count < 3
        @first_name = name[0]
        @last_name = name[1]
      else
        @first_name = name[0]
        @middle_name = name[1]
        @last_name = name[2]
      end
    else
      @first_name = first_name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end
