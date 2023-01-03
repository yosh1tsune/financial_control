class AddCreditCardReferencesToDebts < ActiveRecord::Migration[7.0]
  def change
    add_reference :debts, :credit_card, null: true, foreign_key: true, type: :uuid
  end
end
