ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

puts "How would you print out all the names of ages?"
ages.each do |name, age|
  puts "#{age}: #{name}"
end

puts "How would you print out each key-value pair in the format of <name> is <age> years old?"
ages.each do |name, age|
  puts "#{name} is #{age} years old."
end

puts "How would you print out every person with odd numbered age?"
ages.each do |name, age|
  if age % 2 == 1
    puts "#{name}"
  end
end

puts "How would you delete everyone under 25 years of age?"
ages.delete_if do |name, age|
  age < 25
end
puts ages

puts "What is the name and age of everyone with a name greater than or equal to 5 characters?"
ages.each do |name, age|
  if name.length >= 5
    puts "#{name}: #{age}"
  end
end
