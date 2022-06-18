class Occupation < ApplicationRecord
  has_many :microposts, dependent: :destroy
end