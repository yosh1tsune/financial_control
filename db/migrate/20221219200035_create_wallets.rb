class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true
      t.float :balance

      t.timestamps
    end
  end
end
