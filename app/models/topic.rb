class Topic < ApplicationRecord
	belongs_to :user
  has_many :posts
  
  def self.find_or_nil(find_id)
    Topic.find_by(id: find_id) || NullTopic.new
  end
end
