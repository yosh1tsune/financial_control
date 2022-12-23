class Debt < ApplicationRecord
  belongs_to :wallet

  validates :value, :date, presence: true
end
