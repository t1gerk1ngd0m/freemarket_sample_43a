class CreateTells < ActiveRecord::Migration[5.0]
  def change
    create_table :tells do |t|
      t.string :tell_number, null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
