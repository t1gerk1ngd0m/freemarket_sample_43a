class AddColumnProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :size, :integer
  end

  def down
    remove_column :products, :size, :integer
  end
end
