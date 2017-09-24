puts "Welcome to the Time Capsule Maker-1000! What is your name?"
name = gets.chomp
puts "Hello #{name}! What would you like to add to your time capsule?"
time_capsule = []
input = gets.chomp
while input.downcase != "finished"
  if input.nil? == false
    puts "How many of that item would you like to add?"
    item_amount = gets.chomp
    if item_amount.to_i > 0 && item_amount.to_i < 100
      item_amount.to_i.times do
      time_capsule << input
      end
    puts "#{item_amount} #{input} was added to your time capsule!"
    end
  end
  puts "What else would you like to add?"
  input = gets.chomp
end
puts "Congratulations #{name}, here is a list of the items in your time capsule!: "
uniq_time_capsule = []
#get count of each item
time_capsule.each do |item|
  count = time_capsule.count(item)
  if uniq_time_capsule.include?(item) == false
    uniq_time_capsule << item
    puts "* #{item} (#{count})"
  end
end
