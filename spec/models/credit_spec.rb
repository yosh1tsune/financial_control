require 'rails_helper'

RSpec.describe Credit, type: :model do
  context 'create' do
    let(:wallet) { create(:wallet) }

    it 'successfully' do
      credit = wallet.credits.create(
        value: 1_234.56,
        date: Date.current,
        description: 'Salário'
      )

      expect(wallet.credits.count).to eq 1
      expect(wallet.credits).to include credit
    end

    it 'fail if no wallet provided' do
      expect{
        Credit.create!(
          value: 1_234.56,
          date: Date.current,
          description: 'Salário'
        )
      }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
