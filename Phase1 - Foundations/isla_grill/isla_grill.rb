dinner_total = 178.00
tip = [0.15, 0.18, 0.20, 0.25].sample

puts "Tip #{tip}"
puts "$" + (dinner_total * tip).round(2).to_s
