def disclaimer
  accept = nil
  until accept == "y"
    puts "***DISCLAIMER***\nThis code may not work the way you expect it to.\nBy using this temperamental program, you agree not to\nsue the pants off of its creator.\n***"
    puts "You must accept our disclaimer to proceed! Do you accept? (y/n)"
  accept = gets.chomp
  end
  puts "3 + 2 = #{rand(6)}"
end

disclaimer
