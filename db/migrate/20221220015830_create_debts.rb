class CreateDebts < ActiveRecord::Migration[7.0]
  def change
    create_table :debts, id: :uuid do |t|
      t.float :value
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.date :date
      t.integer :terms
      t.string :description
      t.string :debt_type

      t.timestamps
    end
  end
end
