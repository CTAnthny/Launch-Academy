puts "Hello shopper! What is your name?"
name = gets.chomp
puts "Welcome #{name}! To see our inventory please type 'inventory'. To add an item to your cart please type the item name. To finish please type 'finished'."
inventory = ["old paperback book", "potato", "red onion", "dried lemon", "frankincense", "medicinal herbs", "saffron", "glass spice jar", "red fabric", "orange fabric", "handicrafts", "small Persian rug", "medium Persian rug", "large Persian rug", "extra large Persian rug"]
cart = []
wishlist = []
input = gets.chomp
while input.downcase != "finished"
  if input.downcase == "inventory"
    inventory.each do |item|
      print " * "
      puts item
    end
  elsif inventory.include?(input.downcase)
    cart << input.downcase
    puts "#{input} was added to your cart!"
  else
    wishlist << input.downcase
    puts "Sorry! We don't have that item in stock but we've added it to your wishlist!"
  end
  puts "What else can I help you with?"
  input = gets.chomp
end
puts "#{name}, thanks for trying our online Souq platform. Here is a list of the items in your cart!: "
cart.each do |item|
  puts "* #{item}"
end
puts "And the items in your wishlist!: "
wishlist.each do |item|
  puts "* #{item}"
end
