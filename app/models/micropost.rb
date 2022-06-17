class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :occupation
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :occupation_id, presence: true
  validates :time, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
