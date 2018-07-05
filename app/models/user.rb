class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :name, :email
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    self.role == "admin"
  end
  def following?(user)
    self.followings.include?(user)
  end
  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :commets, dependent: :restrict_with_error
  has_many :restaurants, through: :commets
  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant
  # 一個 User 擁有很多追蹤紀錄 (followships)
  # 透過追蹤紀錄，一個 User 追蹤很多其他 User (followings)
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  # 一個 User 擁有很多朋友 (friendships)
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  # 「使用者有很多追蹤者」的多對多關聯
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user
end
