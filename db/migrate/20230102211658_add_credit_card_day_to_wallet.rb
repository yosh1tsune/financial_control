class AddCreditCardDayToWallet < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :credit_card_day, :integer
  end
end
