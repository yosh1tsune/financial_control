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
      debt.date + index.month
    end
  end
end
