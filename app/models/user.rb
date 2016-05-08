class User < ActiveRecord::Base
  has_many :interactions
  has_many :cities, through: :interactions
  has_many :posts
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  def to_param
    "#{id}-#{first_name}-#{last_name}"
  end

end
