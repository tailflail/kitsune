class User < ApplicationRecord
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
            length: { minimum: 4, maximum: 16, message: "must be between 4 and 16 characters" },
            format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\z/, message: "%{value} format is invalid" }
  validates :avatar, blob: { content_type: %w[image/png image/jpg image/jpeg image/gif],
                                            size_range: 0.1..(10.megabytes) }

  has_one_attached :avatar, dependent: :destroy do |attachable|
    attachable.variant :xlarge, resize_to_fill: [248, 248]
    attachable.variant :large, resize_to_fill: [150, 150]
    attachable.variant :medium, resize_to_fill: [75, 75]
    attachable.variant :small, resize_to_fill: [50, 50]
  end

  has_one :profile, dependent: :destroy
  after_create :create_profile

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :active_relationships,
           class_name: "UserRelationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships,
           class_name: "UserRelationship",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user)
    self.active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    self.active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    self.following.include?(user)
  end

  def followed_by?(user)
    self.followers.include?(user)
  end

  def favorite(post)
    self.favorites.create(post_id: post.id)
  end

  def unfavorite(post)
    self.favorites.find_by(post_id: post.id).destroy
  end

  def has_favorite_post?(post)
    self.favorite_posts.include?(post)
  end

  # user_path helper links by username instead of id
  def to_param
    username
  end

  private

  def create_profile
    Profile.create(user_id: id)
  end
end
