require 'test_helper'

class TopicTest < ActiveSupport::TestCase

	test 'validation check 1' do
		assert_not Topic.new.save
	end

	test 'validation check 2' do
		assert Topic.create(name: 'name', user_id: 1)
	end

end
