#Turning English into .each
#1. # For every element 'word' in the array 'sentences' print out the word.
sentences = []
sentences.each do |word|
  puts word
end

#2. #For every element 'phone_number' in the array 'numbers' print out the phone number if it is a MA area code.
numbers = []
numbers.each do |phone_number|
  if phone_number.include?("617")
    puts phone_number
  end
end

#3. #For every element number in the array 'numbers' print out every odd number.
numbers = []
numbers.each do |number|
  if !number % 2 == 0
    puts number
  end
end

#4. #For every name-age pair in the hash 'ages', print out each pair.
ages = {}
ages.each do |name, age|
  puts "#{name}: #{age}"
end

#5. #For every name-age pair in the hash 'ages', print out a pair if the age is > 10.
ages = {}
ages.each do |name, age|
  if age > 10
    puts "#{name}: #{age}"
  end
end

#6. #For every name-age pair in the hash 'ages', print out a pair if the age is even.
ages = {}
ages.each do |name, age|
  if age % 2 == 0
    puts "#{name}: #{age}"
  end
end
