voter_demographics = [
  { "Jon Smith" => {
      "age" => 25,
      "income" => 50_000,
      "household size" => 1,
      "gender" => "male",
      "education" => "college"
    },
    "Jane Davies"=> {
      "age" => 30,
      "income" => 60_000,
      "household size" => 3,
      "gender" => "female",
      "education" => "high school"
    },
    "Sam Farelly" => {
      "age" => 32,
      "income" => 80_000,
      "household size" => 2,
      "gender" => "unspecified",
      "education" => "college"
    },
    "Joan Favreau" => {
      "age" => 35,
      "income" => 65_000,
      "household size" => 4,
      "gender" => "female",
      "education" => "college"
    },
    "Sam McNulty" => {
      "age" => 38,
      "income" => 63_000,
      "household size" => 3,
      "gender" => "male",
      "education" => "college"
    },
    "Mark Minahan" => {
      "age" => 48,
      "income" => 78_000,
      "household size" => 5,
      "gender" => "male",
      "education" => "high school"
    },
    "Susan Umani" => {
      "age" => 45,
      "income" => 75_000,
      "household size" => 2,
      "gender" => "female",
      "education" => "college"
    },
    "Bill Perault" => {
      "age" => 24,
      "income" => 45_000,
      "household size" => 1,
      "gender" => "male",
      "education" => "did not complete high school"
    },
    "Doug Stamper" => {
      "age" => 45,
      "income" => 75_000,
      "household size" => 1,
      "gender" => "male",
      "education" => "college"
    },
    "Francis Underwood" => {
      "age" => 52,
      "income" => 100_000,
      "household size" => 2,
      "gender" => "male",
      "education" => "college"
    }
  }
]

# Average age
age = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    age << info["age"]
  end
end
total_age = 0
age.each do |num|
  total_age += num
end
puts "The average age of voter_demographics is #{total_age / age.size.to_f}"

# Average income
incomes = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    incomes << info["income"]
  end
end
total_income = 0
incomes.each do |income|
  total_income += income
end
puts "The average income of voter_demographics is #{total_income / incomes.size.to_i}"

# Average household size
household_sizes = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    household_sizes << info["household size"]
  end
end
total_of_household_sizes = 0
household_sizes.each do |size|
  total_of_household_sizes += size
end
puts "The average household size of voter_demographics is #{total_of_household_sizes / household_sizes.size.to_i}"

# Female Percentage
female_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if info["gender"].include?("female")
      female_voters << info["gender"]
    end
  end
end
voter_demographics_count = 0
voter_demographics.each do |hash|
  hash.each do |name, info|
    if !name.nil?
      voter_demographics_count += 1
    end
  end
end

female_percentage = (female_voters.count / voter_demographics_count.to_f)
puts "The female percentage of voter_demographics is #{female_percentage * 100}%"

# Male Percentage
male_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if info["gender"].include?("male") && !info["gender"].include?("female")
      male_voters << info["gender"]
    end
  end
end
male_percentage = (male_voters.count / voter_demographics_count.to_f)
puts "The male percentage of voter_demographics is #{male_percentage * 100}%"

# Unspecified Gender Percentage
unspecificed_gender_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if !info["gender"].include?("male") && !info["gender"].include?("female")
      unspecificed_gender_voters << info["gender"]
    end
  end
end
unspecified_gender_percentage = (unspecificed_gender_voters.count / voter_demographics_count.to_f)
puts "The unspecified gender percentage of voter_demographics is #{unspecified_gender_percentage * 100}%"

# Percent of those who obtained a college education level
college_educated_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if info["education"].include?("college")
      college_educated_voters << info["education"]
    end
  end
end
college_educated_percentage = (college_educated_voters.count / voter_demographics_count.to_f)
puts "The college educated percentage of voter_demographics is #{college_educated_percentage * 100}%"

# Percent of those who obtained a high school education level
high_school_educated_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if info["education"].include?("high school") && !info["education"].include?("did not complete high school")
      high_school_educated_voters << info["education"]
    end
  end
end
high_school_educated_percentage = (high_school_educated_voters.count / voter_demographics_count.to_f)
puts "The high school educated percentage of voter_demographics is #{high_school_educated_percentage * 100}%"

# Percent of those that did not finish high school
unfinished_education_voters = []
voter_demographics.each do |hash|
  hash.each do |name, info|
    if info["education"].include?("did not complete high school")
      unfinished_education_voters << info["education"]
    end
  end
end
unfinished_education_percentage = (unfinished_education_voters.count / voter_demographics_count.to_f)
puts "The percentage of voter_demographics that did not complete high school is #{unfinished_education_percentage * 100}%"
