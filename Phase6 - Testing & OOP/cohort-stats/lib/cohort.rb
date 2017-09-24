class Cohort
  attr_reader :title, :start_date, :end_date, :students, :system_checks

  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = []
    @system_checks = []
  end

  def career_day
    @end_date + 4
  end

  def enroll(student)
    @students << student
  end

  def assign(system_check)
    @system_checks << system_check
  end

  def roster
    roster_string = ""
    roster_string << "Cohort: #{self.title}" + "\n"
    roster_string << "---------------------" + "\n"
    @students.each do |student|
      roster_string << "#{student.name} #{student.email}" + "\n"
    end
    roster_string
  end

  def system_check_completed?(system_check)
    if @system_checks.include?(system_check)
      student_submission_counter = 0
      @students.each do |student|
        if system_check.submissions.any? { |submission| submission.student == student }
          student_submission_counter += 1
        end
      end
    else
      false
    end
    student_submission_counter == @students.size
  end
end
