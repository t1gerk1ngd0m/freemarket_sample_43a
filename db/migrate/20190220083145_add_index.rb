class AddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :likes, :user_id
  end
end
