class ChangeColumnToProduct < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :shipping_charges_burden, :integer, null: false, default: 0
    change_column :products, :shipping_method, :integer, null: false, default: 0
    change_column :products, :number_of_the_days_to_ship, :integer, null: false, default: 0
    change_column :products, :condition, :integer, null: false, default: 0
    change_column :products, :category_large, :integer
    change_column :products, :category_middle, :integer
    change_column :products, :category_small, :integer
    remove_column :products, :size
  end

  def down
    change_column :products, :shipping_charges_burden, :string, null: false
    change_column :products, :shipping_method, :string, null: false
    change_column :products, :number_of_the_days_to_ship, :string, null: false
    change_column :products, :condition, :string, null: false
    change_column :products, :category_large, :string, null: false
    change_column :products, :category_middle, :string, null: false
    change_column :products, :category_small, :string, null: false
    add_column :products, :size, :string, null: false
  end
end
