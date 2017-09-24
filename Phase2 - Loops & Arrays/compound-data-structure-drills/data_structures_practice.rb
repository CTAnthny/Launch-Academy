people_statistics = {
  ages: { twenty_or_younger: 2, over_twenty: 4 },
  eye_color: { blue: 1, green: 1, brown: 4 },
  hometown: { "Newport Beach" => 4, "Boston" => 2 }
}

puts "PEOPLE STATISTICS\n"
puts "AGE"
puts "twenty_or_younger: #{people_statistics[:ages][:twenty_or_younger]}"
puts "over_twenty: #{people_statistics[:ages][:over_twenty]}\n"
puts "EYE_COLOR"
puts "blue: #{people_statistics[:eye_color][:blue]}"
puts "green: #{people_statistics[:eye_color][:green]}"
puts "brown: #{people_statistics[:eye_color][:brown]}\n"
puts "HOMETOWN"
puts "Newport Beach: #{people_statistics[:hometown]["Newport Beach"]}"
puts "Boston: #{people_statistics[:hometown]["Boston"]}"
