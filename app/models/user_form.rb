class UserForm
  include ActiveModel::Model
  
  attr_accessor :name, :email, :password, :password_confirmation, :address_line_1, :address_line_2, :address_line_3

  def save
    user = User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
    UserDetails.create(country: country, city: city)
    log_in(user)
  end
end