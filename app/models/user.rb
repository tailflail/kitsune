class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
            length: { minimum: 4, maximum: 16, message: "must be between 4 and 16 characters" },
            format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\z/, message: "%{value} format is invalid" }
end
