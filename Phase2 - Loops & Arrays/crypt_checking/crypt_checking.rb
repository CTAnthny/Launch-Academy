extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = ["A Comptometer", "A box of phonographic records", "A plastic savings bank", "A set of scales", "A Toast-O-Lator", "A sample of aluminum foil", "A Donald Duck Doll"]
crypt_of_civilization = crypt_of_civilization + extra
puts crypt_of_civilization

puts "Does the array contain 'container of beer'?"
puts crypt_of_civilization.include?("container of beer")
puts "Does the array contain 'Toast-O-Lator'?"
puts crypt_of_civilization.include?("A Toast-O-Lator")
puts "Does the array contain 'plastic bird'?"
puts crypt_of_civilization.include?("plastic bird")
