class City < ActiveRecord::Base
  has_many :interactions
  has_many :posts
end
