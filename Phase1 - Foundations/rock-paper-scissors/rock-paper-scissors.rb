#welcome and get player input
puts "Welcome to rock, paper, scissors! \nChoose rock (r), paper (p), or scissors (s)"
player_roll = gets.chomp

#output player choice
if player_roll == "r"
  puts "Player chose rock."
elsif player_roll == "p"
  puts "Player chose paper."
elsif player_roll == "s"
  puts "Player chose scissors."
else
  abort("Error, that is not a valid shape.")
end

#output computer choice
computer_roll = ["r", "p", "s"].sample
if computer_roll == "r"
  puts "Computer chose rock."
elsif computer_roll == "p"
  puts "Computer chose paper."
elsif computer_roll == "s"
  puts "Computer chose scissors."
end
#player win scenarios
#if player rock and computer scissors, player wins!
if player_roll == "r" && computer_roll == "s"
  puts "Rock beats scissors, player wins!"
#if player paper and computer rock, player wins!
elsif player_roll == "p" && computer_roll == "r"
  puts "Paper beats rock, player wins!"
#if player scissors and computer paper, player wins!
elsif player_roll == "s" && computer_roll == "p"
  puts "Scissors beats paper, player wins!"
end
#computer win scenarios
#if player rock and computer paper, computer wins
if player_roll == "r" && computer_roll == "p"
  puts "Paper beats rock, computer wins!"
#if player paper and computer scissors, computer wins
elsif player_roll == "p" && computer_roll == "s"
  puts "Scissors beats paper, computer wins!"
#if player scissors and computer rock, computer wins
elsif player_roll == "s" && computer_roll == "r"
  puts "Rock beats scissors, computer wins!"
end
#tie scenarios
#if player rock and computer rock
if player_roll == "r" && computer_roll == "r"
  puts "Tie!"
#if player scissors and computer scissors
elsif player_roll == "s" && computer_roll == "s"
  puts "Tie!"
#if player paper and computer paper
elsif player_roll == "p" && computer_roll == "p"
  puts "Tie!"
end
