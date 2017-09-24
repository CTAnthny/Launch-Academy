#Part 1
puts "Welcome to Six Flags!"
puts "How many adult tickets would you like?"
adult_tickets = gets.chomp
puts "How many child tickets would you like?"
child_tickets = gets.chomp
puts "Here are your " + adult_tickets + " adult tickets and " + child_tickets + " child tickets!"

#Part 2
hot_dog = 1.27
hamburger = 4.17
funnel_cake = 3.79
ice_cream_sandwich = 0.75

#Two hamburgers and two ice cream sandwiches
puts (hamburger * 2) + (ice_cream_sandwich * 2)

#Eight funnel cakes and a hot dog
puts (funnel_cake * 8) + hot_dog

#Three of each item
puts (hot_dog * 3) + (hamburger * 3) + (funnel_cake * 3) + (ice_cream_sandwich * 3)
