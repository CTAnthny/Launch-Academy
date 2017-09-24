#Write English interpretations of the following Ruby code:

#1. # numbers is an array
numbers.each do |number|
  puts 3 * number
end
# > For every element in the numbers array, multiply it by 3 and print

#2. # names is an array
names.each do |name|
  puts name.length
end
# > For every element in the names array, print out its character length

#3. # numbers is an array
sum = 0
numbers.each do |number|
  sum += number
end
puts sum
# > For each element in the numbers array, take its amount and add it to the sum, then print the total

#4. # hash is a hash
hash.each do |name, age|
  puts "#{name} is #{age} years old."
end
# > Loop through each key/value pair in the hash and interpolate the values into the string

#5. # account is a hash
sum = 0
account.each do |transaction, value|
  sum += value
end
puts "The value the account is #{sum}"
# > Loop through each key/value pair in the hash and add the value of each value to sum, then print

#6. # addresses is a hash
addresses.each do |name, address|
  puts "#{name} lives on #{address}"
end
# > Loop through each key/value pair in the addresses hash and interpolate the name/address items into the string
