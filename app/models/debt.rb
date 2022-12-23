class Debt < ApplicationRecord
  belongs_to :wallet
  has_many :installments, dependent: :destroy

  validates :value, :date, presence: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }
end
