class UserFormsController < ApplicationController
  def create
    @user_form = UserForm.new(params)
    if @user_form.save
      redirect_to root_url, notice: 'Registration complete'
    else
      flash[:danger] = @user_form.errors.full_messages if @user_form.errors.any?
      redirect_to new_user_path
    end
  end
end