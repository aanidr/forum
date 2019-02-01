class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password

  has_many :topics
  has_many :posts
  has_one :user_detail

  def self.find_or_nil(find_id)
    User.find_by(id: find_id) || NullUser.new
  end
end
