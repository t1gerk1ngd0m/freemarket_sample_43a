class Like < ApplicationRecord
  belongs_to :product, counter_cache: :like_count
  belongs_to :user
end
