class Wallet < ApplicationRecord
  belongs_to :user
  has_many :debts, dependent: :destroy
end
