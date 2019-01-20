class UsersController < ApplicationController
	before_action :logged_in, except: [:new, :create]

	def new
		@user_form = UserForm.new
	end

	def create
		@user_form = UserForm.new(user_params)
		@user_form.log_in
		respond_with @user_form, location: root_path
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
