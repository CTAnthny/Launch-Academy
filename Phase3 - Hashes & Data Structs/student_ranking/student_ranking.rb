def rankings(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student}"
  end
end

students = ["Johhny", "Jane", "Sally", "Elizabeth", "Michael"]
rankings(students)
