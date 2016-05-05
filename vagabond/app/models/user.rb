class User < ActiveRecord::Base
  has_many :posts, through: :user_posts
end
