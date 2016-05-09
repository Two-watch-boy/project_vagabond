class City < ActiveRecord::Base
  has_many :interactions
  has_many :posts
  validates :name, uniqueness: true

  def slug
    name.downcase.gsub(" ", "-")
  end

  def to_param
    "#{id}-#{slug}"
  end

end
