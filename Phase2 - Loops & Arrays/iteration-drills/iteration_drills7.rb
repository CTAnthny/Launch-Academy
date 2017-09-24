people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

puts "How would you print out all the names of people?"
people.each do |name, info|
  puts "#{name}"
end

puts "How would you print out all the names of people and which company they work for?"
people.each do |name, info|
  puts "#{name} works at #{info["company"]}."
end

puts "What are the names of all the children of everyone in people?"
people.each do |name, info|
  if !info["children"].nil?
    puts "#{name}'s children are #{info["children"].join(", ")}"
  end
end

puts "What are the names of all the companies that people work for?"
people.each_value do |info|
  puts "#{info["company"]}"
end

puts "How would you convert all the phone numbers to the same standard (pick one)?"
people.each_value do |info|
  info["phone"].gsub!(" ", ".")
  info["phone"].gsub!("-", ".")
  info["phone"].gsub!(")", "")
  info["phone"].gsub!("(", "")
  puts "#{info["phone"]}"
end
