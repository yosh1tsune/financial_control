class Debt < ApplicationRecord
  belongs_to :wallet
  belongs_to :credit_card, optional: true
  has_many :installments, dependent: :destroy

  validates :value, :date, :terms, presence: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }

  enum debt_type: { credit_card: 'credit_card', cash: 'cash' }
end
