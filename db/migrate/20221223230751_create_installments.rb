class CreateInstallments < ActiveRecord::Migration[7.0]
  def change
    create_table :installments do |t|
      t.references :debt, null: false, foreign_key: true, type: :uuid
      t.decimal :value, precision: 9, scale: 2, null: false
      t.date :expire_date

      t.timestamps
    end
  end
end
