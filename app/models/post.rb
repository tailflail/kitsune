class Post < ApplicationRecord
  acts_as_taggable_on :tags

  validates :title, presence: true, length: { in: 2..60 }
  validates :description, length: { maximum: 5000 }
  validates :tag_list, format: { with: /\A[a-zA-Z][_a-zA-Z0-9," "]+\z/, message: "%{value} format is invalid" }
  validates :image, presence: true, blob: { content_type: %w[image/png image/jpg image/jpeg image/gif],
                                            size_range: 0.1..(100.megabytes) }

  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :comments

  def exists?
    !self.id.nil?
  end
end