# class Student
#   def initialize(first_name, last_name, grades)
#     @first_name = first_name
#     @last_name = last_name
#     @grades = grades
#   end
# end

class Student
  def initialize(student_info)
    if student_info.is_a?(Hash)
      @first_name = student_info[:first_name]
      @last_name = student_info[:last_name]
      @grades = student_info[:grades]
      @average = self.average
    else
      @student_info = student_info
    end
  end

  def average
    total = @grades.inject(0) { |sum, grade| sum + grade }
    total / @grades.size
  end
end
