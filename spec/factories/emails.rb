include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :email do
    address { Faker::Internet.email }
    email_type { Faker::Company.buzzword }
    event { Faker::Hacker.verb }
    timestamp { Faker::Number.number(10) }
  end
end
