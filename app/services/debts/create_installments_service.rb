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
      credit_card_date = credit_card_installment_date
      if debt.credit_card?
        Date.new(
          credit_card_date.year,
          credit_card_date.month,
          debt.wallet.credit_card_day
        )
      else
        debt.date + index.month
      end
    end

    def credit_card_installment_date
      if (debt.wallet.credit_card_day - debt.date.day).to_i >= 14 && @installment.nil?
        debt.date
      else
        (@installment.expire_date || debt.date) + 1.month
      end
    end
  end
end
