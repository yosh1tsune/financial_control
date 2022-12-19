require 'rails_helper'

RSpec.describe Debt, type: :model do
  context 'create' do
    let(:wallet) { create(:wallet) }

    it 'successfully' do
      debt = wallet.debts.create(
        value: 1_234.56,
        terms: 2,
        date: Date.current,
        description: 'Compra Televisão'
      )

      expect(wallet.debts.count).to eq 1
      expect(wallet.debts).to include debt
    end

    it 'fail if no wallet provided' do
      expect{
        Debt.create!(
          value: 1_234.56,
          terms: 2,
          date: Date.current,
          description: 'Compra Televisão'
        )
      }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
