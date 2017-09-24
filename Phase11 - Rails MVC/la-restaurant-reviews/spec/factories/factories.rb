FactoryGirl.define do
  factory :restaurant do
    sequence(:name, 1) { |n| "Best Restaurant Eva #{n}" }
    address '1st Street'
    city 'Boston'
    state 'MA'
    zip '02110'
    description 'They serve really good food'
  end

  factory :review do
    rating 1 + rand(5)
    sequence(:body, 1) { |n| "I really liked this restaurant +#{n}" } 
    restaurant
  end
end
