class Profile < ApplicationRecord
  validates :short_biography, length: { maximum: 50, message: "must be at most 50 characters" }
  validates :long_biography, length: { maximum: 5000, message: "must be at most 5000 characters" }

  belongs_to :user
end
