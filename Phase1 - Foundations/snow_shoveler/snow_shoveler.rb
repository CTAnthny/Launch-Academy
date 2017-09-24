=begin
0 - 50 cubic ft:  $20
50 - 150 cubic ft: $50
150 - 300 cubic ft: $100
300+ cubic ft: $150
=end

puts "How long is the customer's driveway?"
length = gets.chomp
puts "How wide is the customer's driveway?"
width = gets.chomp
puts "How much snow fell?"
snow_depth = gets.chomp
cubic_feet_of_snow = width.to_i * length.to_i * snow_depth.to_i
puts "\nThe total cubic feet of snow is: #{cubic_feet_of_snow}"

case
when cubic_feet_of_snow == (0..50)
  puts "Quote Price: $20"
when cubic_feet_of_snow == (51..150)
  puts "Quote Price: $50"
when cubic_feet_of_snow == (150..300)
  puts "Quote Price: $100"
when cubic_feet_of_snow > 300
  puts "Quote Price: $150"
end
