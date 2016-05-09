module UsersHelper
  def is_premium?
    current_user.role === "premium"
  end
end
