class Wallet < ApplicationRecord
  belongs_to :user
  has_many :debts, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :installments, through: :debts

  validates :credit_card_day, numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 31,
    }
end
