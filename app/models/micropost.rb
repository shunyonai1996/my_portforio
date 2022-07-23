class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :occupation
  belongs_to :industry
  
  has_many :job_discriptions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  accepts_nested_attributes_for :job_discriptions, allow_destroy: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end