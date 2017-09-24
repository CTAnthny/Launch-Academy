FactoryGirl.define do
  factory :manufacturer do
    sequence(:name, 1) { |n| "Toyota #{n}" }
    country "Japan"
  end

  factory :car do
    name "Civic"
    color "blue"
    year 1987
    mileage 50_000
    description "My fancy desc"
    manufacturer
  end


end
