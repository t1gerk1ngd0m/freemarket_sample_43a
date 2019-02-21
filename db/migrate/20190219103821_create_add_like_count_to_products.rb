class CreateAddLikeCountToProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :add_like_count_to_products do |t|
      t.integer :like_count

      t.timestamps
    end
  end
end
