class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :like_status, :user_id, :likeable_id, :likeable_type, presence: true
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}
  validates :like_status, numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 1 }
end
