require 'test_helper'

class PostTest < ActiveSupport::TestCase

	test 'saving' do
		assert Post.create(body: 'tralala')
	end

end
