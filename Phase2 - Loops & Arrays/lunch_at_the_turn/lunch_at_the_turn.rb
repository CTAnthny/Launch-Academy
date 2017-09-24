
lunch_menu = {
  "hamburger" => 4.00,
  "hotdog" => 3.00,
  "fries" => 2.00,
  "chips" => 1.00,
  "water" => 1.25,
  "soda" => 1.50
}

puts "Welcome to Better Burger! Can I take your order?"
order = gets.chomp.downcase
items = []
items = order.split(",")
total = 0

items.each do |item|
  item.gsub!(" ", "")
  if !lunch_menu[item].nil?
    total += lunch_menu[item]
  elsif lunch_menu[item].nil?
    puts "Sorry! We don't have #{item}!"
  end
end
puts "Thanks! Your order total is $#{total}."
