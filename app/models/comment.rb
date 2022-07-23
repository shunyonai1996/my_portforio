class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :comment, presence: true, length: { minimum: 1 }, allow_nil: true
end
