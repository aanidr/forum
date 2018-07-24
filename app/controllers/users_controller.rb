class UsersController < ApplicationController
	before_action :logged_in, except: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			redirect_to '/'
		else
			flash[:danger] = @user.errors.full_messages  if @user.errors.any?
			redirect_to new_user_path
		end
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			flash[:danger] = @user.errors.full_messages if @user.errors.any?
			redirect_to edit_user_path(@user)
		end
	end

	def destroy
		current_user.destroy
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
