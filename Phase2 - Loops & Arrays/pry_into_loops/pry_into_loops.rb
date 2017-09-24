require "pry"
response = nil
while response != "no"
  puts "Can I get you anything?"
  response = gets.chomp
  binding.pry
end
puts "Okay, goodbye!"
