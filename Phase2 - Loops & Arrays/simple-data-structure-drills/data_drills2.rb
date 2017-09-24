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

puts "* How many records are in best_records?"
puts best_records.length
puts "* Who are all the artists listed?"
puts best_records.keys
puts "* What are all the album names in the hash?"
puts best_records.values
puts "* Delete the Eminem key-value pair from the list."
best_records.delete("Eminem")
puts best_records.inspect
puts "* Add your favorite musician and their best album to the list."
best_records["Rush"] = "Greatest Hits"
puts best_records.inspect
puts "* Change Nirvana's album to another."
best_records["Nirvana"] = "Greatest Hits"
puts best_records.inspect
puts "* Is Nirvana included in best_records?"
puts best_records.has_key?("Nirvana")
puts "* Is Soundgarden included in best_records?"
puts best_records.include?("Soundgarden")
puts "* If Soundgarden is not in best_records then add a key-value pair for the band."
if best_records["Soundgarden"].nil?
  best_records["Soundgarden"] = "Black Hole"
  puts best_records.inspect
end
puts "* Which key-value pairs have a key that has a length less than or equal to 6 characters?"
short_record_names = best_records.select { |key_length, value| key_length.length <= 6 }
puts short_record_names.inspect
puts "* Which key-value pairs have a value that is greater than 10 characters?"
long_record_names = best_records.select { |key_length, value| key_length.length > 10 }
puts long_record_names.inspect
