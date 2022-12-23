class ChangeWalletBalanceTypeToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :wallets, :balance, :decimal, precision: 9, scale: 2, null: false
  end
end
