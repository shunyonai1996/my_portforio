class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, counter_cache: :likes_count
  validates_uniqueness_of :micropost_id, scope: :user_id
end
