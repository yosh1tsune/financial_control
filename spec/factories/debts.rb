FactoryBot.define do
  factory :debt do
    value { 1.5 }
    wallet { nil }
    date { "2022-12-18" }
    terms { 1 }
    description { "MyString" }
    debt_type { "MyString" }
  end
end
