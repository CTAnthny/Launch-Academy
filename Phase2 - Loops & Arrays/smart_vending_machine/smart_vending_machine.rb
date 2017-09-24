#Part 1
# Ask the user what's the name of the item they would like.
puts "Hello! What item would you like?"
# Accept the user answer and save it as a variable.
answer = gets.chomp
# Ask the user how many of the thing they would like.
# Accept the user's answer (should be a number) and save it as a variable
puts "How many of those would you like?"
amount = gets.chomp
if amount.downcase.index("tons").nil? == false
  random_amount = nil
  while random_amount != 0 do
  puts "#{answer}"
  random_amount = rand(14)
  end
# Use the answer to start a .times loop, in which you print the word the user asked for, the number of times that they specified.
elsif amount.to_i > 0 && amount.to_i < 15
  amount.to_i.times do
  puts "#{answer}"
  end
# Invalid input
else
  abort("Sorry, I can't help you.")
end
puts "There you go! come again!"
