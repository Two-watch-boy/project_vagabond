class User < ActiveRecord::Base

  has_many :posts
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }
  validates :email, length: { maximum: 255 }
  # validates :email, uniqueness: true


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
