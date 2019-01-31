class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.references :user, foreign_key: true
      t.string :card_number, null: false
      t.integer :expiration_date, null: false
      t.string :security_code, null: false
    end
  end
end
