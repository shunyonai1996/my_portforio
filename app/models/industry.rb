class Industry < ApplicationRecord
  has_many :occupations, dependent: :destroy
  has_many :microposts, dependent: :destroy
end