class Occupation < ApplicationRecord
  belongs_to :industry
  has_many :microposts
end