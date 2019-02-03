class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,         null: false, default: ""
      t.references :user,     foreign_key: true
      t.string :description, null: false
      t.string :category_large, null: false
      t.string :category_middle, null: false
      t.string :category_small, null: false
      t.string :brand
      t.string :size, null: false
      t.string :shipping_charges_burden, null: false
      t.string :dispatch_area, null: false
      t.string :shipping_method, null: false
      t.string :number_of_the_days_to_ship, null: false
      t.integer :price, null: false
      t.string :condition, null: false

      t.timestamps null: false, foreign_key: true
    end
  end
end
