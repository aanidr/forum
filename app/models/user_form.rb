class UserForm
  include ActiveModel::Model
  validate :validate_children
  validates :name, length: {minimum: 6}
  validates :password, length:{minimum: 6}
  
  attr_accessor :name, :email, :password, :password_confirmation, :address_line_1, :address_line_2, :address_line_3, :avatar

  def save
    return false if invalid?
    user.save!
    user_detail.save!
  end

  def user
    @user ||= User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
    @user.avatar.attach(avatar)
    @user
  end

  def user_detail
    @user_detail ||= user.build_user_detail(address_line_1: address_line_1, address_line_2: address_line_2, address_line_3: address_line_3)
  end

  private
  def validate_children
    add_errors(user.errors) if user.invalid?
    add_errors(user_detail.errors) if user_detail.invalid?
  end

  def add_errors(errors_to_add)
    errors_to_add.each do |attribute, message|
      errors.add(attribute, message)
    end
  end
end