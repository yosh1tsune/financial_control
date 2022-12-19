class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits, id: :uuid do |t|
      t.float :value
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.date :date
      t.string :description
      t.string :credit_type

      t.timestamps
    end
  end
end
