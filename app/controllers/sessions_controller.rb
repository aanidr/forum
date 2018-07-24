class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(name: params[:name])
		if user.nil?
			flash.now[:danger] = 'Username is incorrect'
			render 'new' and return
		end
		if user.authenticate(params[:password])
			log_in user
			redirect_to user_path(user)
		else
			flash.now[:danger] = 'Password is incorrect'
			render 'new'
		end
	end

	def destroy
		log_out
		render 'new'
	end

end
