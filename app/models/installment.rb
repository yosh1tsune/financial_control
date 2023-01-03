class Installment < ApplicationRecord
  belongs_to :debt

  validates :value, :expire_date, presence: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }

  scope :by_month,
        ->(month, year) {
          where("to_char(expire_date, 'MM') = ? and to_char(expire_date, 'YYYY') = ?", month, year)
        }
end
