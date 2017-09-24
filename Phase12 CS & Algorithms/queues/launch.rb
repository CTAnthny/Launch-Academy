require_relative 'lib/queue'

buffer = Launch::Queue.new
File.open('paragraph.txt', 'r') do |f|
  f.each_char do |char|
    buffer.enter(char)
  end
end

# n = array.length
# circular_array = i % n
