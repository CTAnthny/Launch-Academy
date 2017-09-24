extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = ["A Comptometer", "A box of phonographic records", "A plastic savings bank", "A set of scales", "A Toast-O-Lator", "A sample of aluminum foil", "A Donald Duck Doll"]
crypt_of_civilization = crypt_of_civilization + extra

# Using a while loop, print out each element of the array crypt_of_civilization. Do the same with an each loop!
#while
i = 0
while i < crypt_of_civilization.length do
  print " * "
  puts crypt_of_civilization[i]
  i += 1
end
#each
crypt_of_civilization.each do |x|
  print " * "
  puts x
end
