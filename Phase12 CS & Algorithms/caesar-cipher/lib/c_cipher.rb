class CaesarCipher
  def encode(string, number)
    s_w_uppers = string.gsub(/[A-Z]/) { |c| ( ( ( ((c.ord - 65) + (number % 26)) % 26) + 65) ).chr('UTF-8') }
    encoded_string = s_w_uppers.gsub(/[a-z]/) { |c| ( ( ( ((c.ord - 97) + (number % 26)) % 26) + 97) ).chr('UTF-8') }
    encoded_string
  end
end
# [A-Z] (65)-90
# [a-z] (97)-122
# if number over 26, return n % 26

# Sol. #2

# CONST U = [A-Z]
# CONST L = [a-z]
# enc_string = []

# string.each_char |c| do
#   if U.include?(c)
#     enc_string << U[index + n % 26]
#   elsif L.include?(c)
#     enc_string << L[index]
#   else
#     enc_string << c
#   end
# end
# enc_string
