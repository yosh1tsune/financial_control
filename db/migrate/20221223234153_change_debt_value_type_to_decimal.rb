class ChangeDebtValueTypeToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :debts, :value, :decimal, precision: 9, scale: 2, null: false
  end
end
