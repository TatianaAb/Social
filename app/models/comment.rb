class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :commenter, class_name: "User"
  belongs_to :post
end
