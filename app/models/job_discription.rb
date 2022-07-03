class JobDiscription < ApplicationRecord
  belongs_to :micropost
  validates :time, presence: true
  validates :content, presence: true
end
