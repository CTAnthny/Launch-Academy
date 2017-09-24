class SystemCheckSubmission
  attr_reader :solution, :student, :grade

  def initialize(solution, student)
    @solution = solution
    @student = student
  end

  def assign_grade(grade)
    if grade.is_a?(Integer) && grade >= 0 && grade <= 100
      @grade = grade
    else
      raise InvalidGradeError
    end
  end

  def graded?
    !@grade.nil?
  end
end

class InvalidGradeError < StandardError
end
