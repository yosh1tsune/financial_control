class Wallet < ApplicationRecord
  belongs_to :user
  has_many :debts, dependent: :destroy
  has_many :credits, dependent: :destroy
end
