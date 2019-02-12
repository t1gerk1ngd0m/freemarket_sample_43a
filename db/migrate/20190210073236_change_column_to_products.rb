class ChangeColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    def change
      add_foreign_key :products, :categories, column: :category_large
      add_foreign_key :products, :categories, column: :category_middle
      add_foreign_key :products, :categories, column: :category_small
    end
  end
end
