class RemoveColumnsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :zip, :string
    remove_column :users, :prefecture, :string
    remove_column :users, :city, :string
    remove_column :users, :block, :string
    remove_column :users, :building, :string
    remove_column :users, :tell, :string
  end
end
