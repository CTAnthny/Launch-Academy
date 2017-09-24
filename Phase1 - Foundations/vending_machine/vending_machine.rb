items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"

#ask the user to select an item
puts "What item would you like?"
item_selection = gets.chomp
#store item index
item_index = items_we_have.index(item_selection)
#print index
if item_index.nil?
  puts "Sorry, I don't have that item."
else
  puts "Item index: #{item_index}"
end
