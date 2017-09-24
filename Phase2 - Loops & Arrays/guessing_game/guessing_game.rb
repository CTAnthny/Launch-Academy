require "pry"
# Ask the user what difficulty they would like to play at - "easy" or "hard".
puts "Welcome to the Guessing Game! What difficulty would you like to play? Easy or Hard?"
# Accept user input and save it as a variable.
difficulty_response = gets.chomp
# Pick a random number. If the user chose "easy", the number should be between 1 and 10. If the user chose "hard", the number should be between 1 and 20.
if difficulty_response.downcase == "easy"
  puts "I've picked a number between 1 and 10. Now guess it!"
  number = rand(10) + 1
  score = 1
  user_guess = gets.chomp.to_i
  while user_guess != number
    puts "Nope, try again!"
    user_guess = gets.chomp.to_i
    score += 1
  end
  puts "You got it! Congratulations! \nYour score was: #{score}"
else
  puts "I've picked a number between 1 and 20. Now guess it!"
  number = rand(20) + 1
  score = 1
  binding.pry
  user_guess = gets.chomp.to_i
  while user_guess != number
    puts "Nope, try again!"
    user_guess = gets.chomp.to_i
    score += 1
  end
  puts "You got it! Congratulations! \nYour score was: #{score}"
end
