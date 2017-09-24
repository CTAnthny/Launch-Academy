# The first player to win two rounds is declared the winner and the game ends.
# The number of rounds won by the player and the computer are shown each round.
#
# Output the winner of the game before exiting.
# The computer opponent randomly chooses between rock, paper, and scissors each round.
# The user chooses their shape by typing "r" (rock), "p" (paper), or "s" (scissors) each round.
# If the player enters an invalid shape, print an error message and start the next round.
# If both players choose the same shape, it is a tie and no one wins the round.

puts "Welcome to Rock-Paper-Scissors!"
player_score = 0
computer_score = 0
game_options = {"r" => "rock", "p" => "paper", "s" => "scissors"}

until player_score == 2 || computer_score == 2
#Display info
  puts "Player Score: #{player_score}, Computer Score: #{computer_score} \nChoose rock ('r'), paper ('p'), or scissors ('s')"
  user_choice = gets.chomp

#Output player choice
  if user_choice == 'exit' || user_choice == 'quit'
    abort("Exiting..")
  elsif !game_options.keys.include?(user_choice)
    puts "Error! Invalid input!"
  else
    output_string = game_options[user_choice]
    puts "Player chose #{output_string}!"

#Output computer choice
    computer_shape = ['r', 'p', 's'].sample
    computer_output_string = game_options[computer_shape]
    puts "Computer chose #{computer_output_string}"

#Win cases
  #Computer wins!
    if computer_shape == 'r' && user_choice == 's'
      puts "Rock beats scissors, computer wins the round!"
      computer_score += 1
    elsif computer_shape == 'p' && user_choice == 'r'
      puts "Paper beats rock, computer wins the round!"
      computer_score += 1
    elsif computer_shape == 's' && user_choice == 'p'
      puts "Scissors beats paper, computer wins the round!"
      computer_score += 1
    end
    #Player wins!
    if user_choice == 'r' && computer_shape == 's'
      puts "Rock beats scissors, player wins the round!"
      player_score += 1
    elsif user_choice == 'p' && computer_shape == 'r'
      puts "Paper beats rock, player wins the round!"
      player_score += 1
    elsif user_choice == 's' && computer_shape == 'p'
      puts "Scissors beats paper, player wins the round!"
      player_score += 1
    end
#Output tie
    if computer_shape == user_choice
      puts "Tie! Choose again."
    end
  end
end

#Output score
if player_score == 2
  puts "Player wins the game with a score of #{player_score}!"
elsif computer_score == 2
  puts "Computer wins the game with a score of #{computer_score}!"
end
