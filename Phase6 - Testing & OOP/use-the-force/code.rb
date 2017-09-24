# YOUR CODE HERE
def plus_two(number)
  number + 2
end

def subtract_or_multiply_by_two(number)
  if number < 0
    result = number - 2
  elsif number >= 0
    result = number * 2
  end
  result
end

def repeat_last_word(string)
  words = string.split(" ")
  string << " #{words[-1]}"
end

def give_example(input)
  if input == 'fixnum'
    1
  elsif input == 'string'
    ""
  else
    "input does not match any Ruby class"
  end
end

def output_to_terminal
  puts 'Hello World'
end

def raise_standard_error
  raise StandardError
end

def add_five_and_ten(number_array = [])
  number_array.push(5).push(10)
end
