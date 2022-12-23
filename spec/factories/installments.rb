FactoryBot.define do
  factory :installment do
    debt
    value { "9.99" }
    expire_date { "2022-12-23" }
  end
end
