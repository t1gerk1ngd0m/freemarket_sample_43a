class AddLikeCountToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :like_count, :integer
  end
end
