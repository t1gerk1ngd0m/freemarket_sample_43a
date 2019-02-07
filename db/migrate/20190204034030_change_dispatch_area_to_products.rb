class ChangeDispatchAreaToProducts < ActiveRecord::Migration[5.0]

  def up
    change_column :products, :dispatch_area, :integer, null: false, default: 0
  end

  def down
    change_column :products, :dispatch_area, :string, null: false
  end

end
