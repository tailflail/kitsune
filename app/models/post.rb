class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..60 }
  validates :description, length: { maximum: 5000 }
  validates :image, presence: true, blob: { content_type: %w[image/png image/jpg image/jpeg image/gif],
                                            size_range: 0.1..(100.megabytes) }

  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
end
