def average_calc(grade_list)
  total_grades = grade_list.inject(0) do |sum, grade|
    sum += grade
  end
  total_grades / grade_list.length.to_f
end

def letter_grade(average)
  if average >= 90
    "A"
  elsif average >= 80
    "B"
  elsif average >= 70
    "C"
  elsif average >= 60
    "D"
  else
    "F"
  end
end

jane = [98,95,88,97,74]
samantha = [85,93,98,88,49]
matt = [87,93,89,97,65]

matt_grade = average_calc(matt)
puts matt_grade
puts letter_grade(matt_grade)
