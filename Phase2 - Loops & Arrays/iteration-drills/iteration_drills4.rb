array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

puts "How would you print out each name backwards in array?"
array.each do |name|
  puts name.reverse
end

puts "What are the total number of characters in the names in array?"
character_sum = 0
array.each do |name|
  character_sum += name.length
end
puts character_sum

puts "How many names in array are less than 5 characters long?"
short_name_count = 0
array.each do |name|
  if name.length < 5
    short_name_count += 1
  end
end
puts short_name_count

puts "How many names in array end in a vowel?"
vowel_ending_names = 0
array.each do |name|
  if name.end_with?("a") || name.end_with?("e") || name.end_with?("i") || name.end_with?("o") ||   name.end_with?("u")
    vowel_ending_names += 1
  end
end
puts vowel_ending_names

puts "How many names in array are more than 5 characters long?"
long_name_count = 0
array.each do |name|
  if name.length > 5
    long_name_count += 1
  end
end
puts long_name_count

puts "How many names in array are exactly 5 characters in length?"
name_count = 0
array.each do |name|
  if name.length == 5
    name_count += 1
  end
end
puts name_count
