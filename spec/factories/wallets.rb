FactoryBot.define do
  factory :wallet do
    user
    balance { 1.5 }
  end
end
