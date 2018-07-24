class User < ApplicationRecord
	validates :name, presence: true, length: {minimum: 6}, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, length:{minimum: 6}

	has_secure_password

	has_many :topics
	has_many :posts
end
