class RemoveCreditCardDayFromWallet < ActiveRecord::Migration[7.0]
  def change
    remove_column :wallets, :credit_card_day
  end
end
