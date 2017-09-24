def perimeter(width, height = nil)
  if height.nil?
    puts width * 4
  else
    puts (width * 2) + (height * 2)
  end
end
puts "What width?"
width = gets.chomp.to_i
puts "What height?"
height = gets.chomp.to_i
perimeter(width, height)
