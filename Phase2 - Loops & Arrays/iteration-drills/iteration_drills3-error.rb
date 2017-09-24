
array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]
#Write Ruby code to find out the answers to the following questions:

puts "What is the sum of all the numbers in array?"
array_sum = array.inject(0) do |sum, number|
  sum += number
end
puts array_sum
puts "How would you print out each value of the array?"
array.each do |value|
  puts value
end

puts "What is the sum of all of the even numbers?"
array.inject(0) do |sum, number|
  if number % 2 == 0
    sum += number
    puts sum
  end
end

# puts "What is the sum of all of the odd numbers?"
# array.inject(0) do |sum, number|
#   if !number % 2 == 0
#     sum += number
#     puts sum
#   end
# end
#
# puts "What is the sum of all the numbers divisble by 5?"
# array.inject(0) do |sum, number|
#   if number % 5 == 0
#     sum += number
#     puts sum
#   end
# end

# puts "What is the sum of the squares of all the numbers in the array?"
# array.inject(0) do |sum, number|
#   sum = number * number
#   puts sum
# end
