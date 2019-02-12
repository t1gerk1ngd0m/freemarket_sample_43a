class RemoveSizeFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :size, foreign_key: true
  end
end
