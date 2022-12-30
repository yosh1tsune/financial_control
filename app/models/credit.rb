class Credit < ApplicationRecord
  belongs_to :wallet

  validates :value, :date, presence: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }
end
