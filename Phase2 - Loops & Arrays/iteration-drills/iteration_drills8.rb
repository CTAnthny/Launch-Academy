people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

puts "What are the names of everyone in people?"
people.each do |person_hash|
  person_hash.each_key do |person|
    puts person
  end
end

puts "What are the names of all the children in people?"
people.each do |person_hash|
  person_hash.each do |person, info|
    if !info["children"].nil?
      info["children"].each do |child|
        puts child
      end
    end
  end
end

puts "How would you create a new hash called phone_numbers that has a key of a name and value of a phone number in people?"
people[2] = phone_numbers = { "name" => "phone number" }
puts people[2]
puts "How would you create a new hash called employers that has a key of a name and a value of a company name in people?"
people[3] = employers = { "name" => "company name" }
puts people[3]
puts "How would you create a new hash called children_count that has a key of a name and a value of the number of children a person has?"
people[4] = children_count = { "name" => "number of children" }
puts people[4]
puts people
