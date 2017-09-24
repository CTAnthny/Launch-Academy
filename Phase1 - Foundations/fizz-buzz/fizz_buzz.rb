#Write a program that prints out the numbers from 1 to 100, each on a new line.
(1..100).each do |x|

#If the number is divisible by 3 and 5, print out the word "FizzBuzz" instead.
  if x % 3 == 0 && x % 5 == 0
    puts "FizzBuzz"
#If the number is divisible by 5, print out the word "Buzz" instead.
  elsif x % 5 == 0
    puts "Buzz"
#If the number is divisible by 3, print out the word "Fizz" instead.
  elsif x % 3 == 0
    puts "Fizz"
  else
    puts x
  end
end
