class ChangeDataColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :category_large, :string, null: false, default: ""
    change_column :products, :category_middle, :string, null: false, default: ""
    change_column :products, :category_small, :string, null: false, default: ""
  end
end
