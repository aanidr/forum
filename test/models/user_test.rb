require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test 'validations check 1' do
		user = User.new
		assert_not user.save
	end

	test 'validations check 2' do
		user = User.new
		user.name = 'aaa'
		assert_not user.save
	end

	test 'check_save' do
		assert User.create(name: 'test_name', email: 'some@email.com')
	end

end
