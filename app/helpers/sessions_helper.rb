module SessionsHelper

	def current_user
		User.find_by(id: session[:user_id])
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
		session[:user_id] = nil
	end

	def logged_in?
		!current_user.nil?
	end

	def logged_in
		if !logged_in?
			flash[:danger] = 'Log in to proceed'
			redirect_to sessions_new_path
		end
	end

end
