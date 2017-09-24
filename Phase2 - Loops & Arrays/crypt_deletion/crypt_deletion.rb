extra = ["container of beer", "Lionel model train set", "Ingraham pocket watch"]
crypt_of_civilization = ["A Comptometer", "A box of phonographic records", "A plastic savings bank", "A set of scales", "A Toast-O-Lator", "A sample of aluminum foil", "A Donald Duck Doll"]
crypt_of_civilization = crypt_of_civilization + extra
puts crypt_of_civilization

# Remove the following items from the array crypt_of_civilization:
# "Comptometer"
# "set of scales"
# "sample of aluminum foil"

crypt_of_civilization.delete("A Comptometer")
crypt_of_civilization.delete("A set of scales")
crypt_of_civilization.delete("A sample of aluminum foil")
puts crypt_of_civilization
