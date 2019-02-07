class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ""
      t.integer :parent_id, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.timestamps null: false
    end
  end
end
