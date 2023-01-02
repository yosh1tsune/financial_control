FactoryBot.define do
  factory :wallet do
    user
    balance { 1.5 }
    credit_card_day { 15 }
  end
end
