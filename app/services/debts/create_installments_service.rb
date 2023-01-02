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
        debt.installments.create(
          value: installment_value,
          expire_date: installment_date(index)
        )
      end
    end

    def installment_value
      (debt.value / debt.terms).round(2)
    end

    def installment_date(index)
      credit_card_date = credit_card_installment_date(index)
      if debt.credit_card?
        Date.new(
          credit_card_date.year,
          credit_card_date.month,
          credit_card_day(credit_card_date)
        )
      else
        debt.date + index.month
      end
    end

    def credit_card_installment_date(index)
      return debt.date unless (17 - debt.date.day).to_i <= 14

      debt.date + (index + 1).month
    end

    def credit_card_day(date)
      if date.month == 2 && debt.wallet.credit_card_day > 28
        28
      else
        debt.wallet.credit_card_day || date.day
      end
    end
  end
end
