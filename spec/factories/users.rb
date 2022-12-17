FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'user1234' }
  end
end
