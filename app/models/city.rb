class City < ActiveRecord::Base
  has_many :posts

  def to_param
    "#{id}-#{name}"
  end

end
