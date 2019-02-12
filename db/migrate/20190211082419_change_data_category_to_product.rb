class ChangeDataCategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :category_large, :integer, null: true
    change_column :products, :category_middle, :integer, null: true
    change_column :products, :category_small, :integer, null: true
  end
end
