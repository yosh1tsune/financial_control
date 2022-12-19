require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'create' do
    let!(:user) { create(:user) }

    it 'successfully' do
      user.create_wallet(balance: 10_000)

      expect(user.wallet.present?).to be_truthy
      expect(user.wallet.balance).to eq 10_000
    end

    it 'fail if no user provided' do
      expect{
        Wallet.create!(balance: 10_000)
      }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
