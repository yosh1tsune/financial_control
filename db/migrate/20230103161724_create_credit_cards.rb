class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.integer :expire_day, null: false
      t.integer :cut_day, null: false
      t.string :name, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
