class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 1}
  has_secure_password

  has_many :posts, {foreign_key: :sender_id}
  has_many :wall_posts, {foreign_key: :receiver_id, class_name: "Post"}
  has_many :comments, {foreign_key: :commenter_id}
  has_many :likes
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end
