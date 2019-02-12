class AddColumnToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :integer, null: false, default: 0
  end
end
