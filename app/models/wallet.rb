class Wallet < ApplicationRecord
  belongs_to :user
  has_many :debts, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :installments, through: :debts
  has_many :credit_cards, dependent: :destroy
end
