FactoryBot.define do
  factory :credit_card do
    wallet
    expire_day { 1 }
    cut_day { 1 }
    name { "MyString" }
    active { true }
  end
end
