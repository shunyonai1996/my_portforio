class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, counter_cache: :likes_count
  validates :micropost, uniqueness: { scope: :user_id }
end
