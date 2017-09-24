sales_value = 0
while sales_value < 100
  puts "Enter your values here!"
  new_value = gets.chomp.to_i
  sales_value = sales_value + new_value
  if sales_value > 100
    puts "You've reached 100!"
  end
end
