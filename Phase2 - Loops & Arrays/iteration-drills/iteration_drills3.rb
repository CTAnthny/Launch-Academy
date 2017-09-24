array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

puts "What is the sum of all the numbers in array?"
sum = 0
array.each do |num|
  sum += num
end
puts sum

puts "How would you print out each value of the array?"
array.each do |num|
  puts num
end

puts "What is the sum of all of the even numbers?"
sum = 0
array.each do |num|
  if num % 2 == 0
    sum += num
  end
end
puts sum

puts "What is the sum of all of the odd numbers?"
sum = 0
array.each do |num|
  if num % 2 == 1
    sum += num
  end
end
puts sum

puts "What is the sum of all the numbers divisble by 5?"
sum = 0
array.each do |num|
  if num % 5 == 0
    sum += num
  end
end
puts sum

puts "What is the sum of the squares of all the numbers in the array?"
sum = 0
array.each do |num|
  sum = num * num
end
puts sum
