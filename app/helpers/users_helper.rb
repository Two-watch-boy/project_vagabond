module UsersHelper
  def is_premium?
    if current_user
      current_user.premium === true
    else
      false
    end
  end
end
