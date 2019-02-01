class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password

  has_many :topics
  has_many :posts
  has_one :user_detail
end
