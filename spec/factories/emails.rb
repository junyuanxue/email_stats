include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :email do
    address { Faker::Internet.email }
    email_type { Faker::Company.buzzword }
    event { Faker::Hacker.verb }
    timestamp { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
