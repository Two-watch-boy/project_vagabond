class UserMailer < AcionMailer::Base
  default from: 'notifications@footprints.com'

  def welcome_email(user)
    @user = user
    @url = 'http://footprints.com/login'
    mail(to: @user.email, subject: 'Welcome to FootPrints!')
  end

end
