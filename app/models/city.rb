class City < ActiveRecord::Base
  has_many :interactions
  has_many :posts

  def to_param
    "#{id}-#{name}"
  end

end
