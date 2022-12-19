FactoryBot.define do
  factory :credit do
    value { 1.5 }
    wallet
    date { "2022-12-18" }
    description { "MyString" }
    credit_type { "MyString" }
  end
end
