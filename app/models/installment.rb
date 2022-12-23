class Installment < ApplicationRecord
  belongs_to :debt

  validates :value, :expire_date, presence: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }
end
