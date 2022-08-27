class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_one_attached :image
  attr_accessor :remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :birthday, presence: true
  #画像アップロードのための記述
  mount_uploader :avatar, AvatarUploader

  class << self #Userクラスを呼び出す
    #渡された文字列のハッシュを返す
    def digest(string) #User.が不要
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    #ランダムなトークンを返す
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
    
  #永続セッションのためにユーザをデータベースに記憶
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end

  #フォロー機能のメソッドを記述
  def follow(user_id)
    relationships.create(follow_id: user_id) unless (self == user_id)
  end

  def unfollow(user_id)
    relationships.find_by(follow_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def guest?(user)
    user
  end
  
end