# Debts::CreateInstallmentsService
module Debts
  class CreateInstallmentsService
    attr_reader :debt

    def initialize(debt:)
      @debt = debt
    end

    def execute
      create_installments
    end

    private

    def credit_card
      credit_card ||= debt.credit_card
    end

    def create_installments
      debt.terms.times do |index|
        @installment = debt.installments.create(
          value: installment_value,
          expire_date: installment_date(index)
        )
      end
    end

    def installment_value
      (debt.value / debt.terms).round(2)
    end

    def installment_date(index)
      return debt.date + index.month unless credit_card.present?

      Date.new(
        credit_card_installment_date.year,
        credit_card_installment_date.month,
        credit_card.expire_day
      )
    end

    def credit_card_installment_date
      if (credit_card.cut_day > debt.date.day) && @installment.nil?
        debt.date
      else
        (@installment.try(:expire_date) || debt.date) + 1.month
      end
    end
  end
end
