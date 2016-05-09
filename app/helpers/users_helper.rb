module UsersHelper
  def is_premium?
    current_user.premium === true
  end
end
