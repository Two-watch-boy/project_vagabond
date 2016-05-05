class Post < ActiveRecord::Base
  belongs_to :user, through: user_posts
end
