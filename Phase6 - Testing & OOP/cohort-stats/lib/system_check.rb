require_relative "lesson"

class SystemCheck < Lesson
  attr_reader :submissions

  def initialize(name, due_date)
    @name = name
    @due_date = due_date
    @submissions = []
  end

  def add_submission(submission)
    @submissions << submission
  end

  def average_grade
    if !@submissions.nil?
      grade_sum = 0
      @submissions.each do |submission|
        grade_sum += submission.grade
      end
      grade_sum / @submissions.size.to_f
    end
  end

  def did_student_complete_system_check?(student)
    if !@submissions.nil?
      @submissions.any? do |submission|
        submission.student == student
      end
    else
      false
    end
  end

  def submittable?
    true
  end
end
