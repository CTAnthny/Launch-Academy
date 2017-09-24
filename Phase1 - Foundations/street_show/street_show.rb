#Part 1
knife_juggling = 2.10 + 0.77 + 5.00 + 1.00 + 3.00
torch_juggling = 6.00 + 3.50 + 7.00
hand_balancing = 2.00 + 1.00
human_blockhead = 0.75 + 0.43
puts "Knife Juggling: \n" + knife_juggling.round(2).to_s
puts "Torch Juggling: \n" + torch_juggling.to_s
puts "Hand Balancing: \n" + hand_balancing.to_s
puts "Human Blockhead: \n" + human_blockhead.to_s

total_tips = knife_juggling + torch_juggling + hand_balancing + human_blockhead
puts "Total: \n" + total_tips.round(2).to_s

average_tips = total_tips / 12
puts "Average Tip Value: \n" + average_tips.round(2).to_s

#Part 2
puts "\nHello everyone and welcome to the show! Today, I will be showing you acts of great daring! Can I have an audience volunteer?"
puts "Oh thank you so much! What's your name?"
volunteer = gets.chomp
puts "Everyone give a big round of applause for " + volunteer + "!"
puts "Now, " + volunteer + " what is your favorite number?"
volunteer_number = gets.chomp
puts "Alright " + volunteer + ", my friend and I will be juggling these knives around you for " + volunteer_number + " seconds. Are you prepared to be amazed!?"
