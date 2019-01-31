class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.references :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :zip, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.timestamps null: false
    end
  end
end
