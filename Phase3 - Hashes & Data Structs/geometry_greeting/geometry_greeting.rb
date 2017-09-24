def greet(name, language = nil)
  if language.nil?
    random_greeting = ["Hi", "Yo", "Hey", "Howdy"].sample
    puts "#{random_greeting} #{name}!"
  elsif language.downcase == "spanish"
    puts "Hola #{name}!"
  elsif language.downcase == "italian"
    puts "Ciao #{name}!"
  elsif language.downcase == "french"
    puts "Bonjour #{name}!"
  end
end

greet("John", "french")
