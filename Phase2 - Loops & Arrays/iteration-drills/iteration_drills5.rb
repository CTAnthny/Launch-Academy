best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

puts "How would you print out all the names of the artists?"
puts best_records.keys

puts "How would you print out all the names of the albums?"
puts best_records.values

puts "Which artist has the longest name?"
puts best_records.keys.max

puts "How would you change all the album titles for every artist to Greatest Hits?"
all_greatest_hits = {}
best_records.each do |artist, album|
  all_greatest_hits[artist] = "Greatest Hits"
end
puts best_records
puts all_greatest_hits

puts "How would you delete a key-value pair if the artist's name ends in a vowel?"
best_records.delete_if do |artist, album|
  artist.end_with?("a") || artist.end_with?("e") || artist.end_with?("i") || artist.end_with?("o") || artist.end_with?("u")
end
puts best_records
