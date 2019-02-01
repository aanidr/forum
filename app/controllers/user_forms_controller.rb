class UserFormsController < ApplicationController
  def create
    @user_form = UserForm.new(user_form_params)
    if @user_form.save
      log_in @user_form.user
      redirect_to root_url, notice: 'Registration complete'
    else
      flash[:danger] = @user_form.errors.full_messages if @user_form.errors.any?
      redirect_to new_user_path
    end
  end

  private
  def user_form_params
    params.require(:user_form).permit!
  end
end