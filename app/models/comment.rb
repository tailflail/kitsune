class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :post

  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
end
