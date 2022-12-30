require 'rails_helper'

RSpec.describe Debts::CreateInstallmentsService do
  let(:debt) { create(:debt, value: 2_000, date: Date.current, terms: 3) }
  let(:service) { described_class.new(debt: debt) }

  context '#execute' do
    it 'successfully' do
      service.execute

      expect(debt.installments.count).to eq 3
      expect(debt.installments.pluck :value).to eq [666.67, 666.67, 666.67]
      expect(debt.installments.pluck :expire_date).to eq [debt.date, debt.date + 1.month, debt.date + 2.month]
    end
  end

  context '#installment_value' do
    it 'correct value' do
      expect(service.send(:installment_value)).to eq 666.67
    end
  end

  context '#installment_date' do
    it 'correct value' do
      expect(service.send(:installment_date, 1)).to eq (debt.date + 1.month)
    end
  end
end