class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :post

  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy

  def parent
    Comment.find(self.parent_id)
  end
end
