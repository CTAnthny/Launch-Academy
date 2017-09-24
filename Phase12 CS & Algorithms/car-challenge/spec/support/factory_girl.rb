require 'factory_girl'

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Manufacturer #{n}" }
    country "Japan"
  end
  factory :car do
    sequence(:name) { |n| "Car Number #{n}" }
    association :manufacturer, factory: :manufacturer
    color "White"
    year 2000
    mileage 10000
  end
end
