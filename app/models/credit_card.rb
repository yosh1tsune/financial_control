class CreditCard < ApplicationRecord
  belongs_to :wallet
  has_many :debts
  has_many :installments, through: :debts

  validates :expire_day, :cut_day, :name, :active, presence: true
  validates :expire_day, :cut_day, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 31,
  }
end
