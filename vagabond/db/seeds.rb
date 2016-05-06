# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
User.destroy_all


user_data = []

5.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  user_data << {
    first_name: first,
    last_name: last,
    email: "#{first[0]}_#{last}@example.com".downcase,
    photo: "https://www.keypascoru.com/files/User_ring.png",
    location: "San Francisco, CA",
    password: "a"
  }
end

users = User.create(user_data)



users.each do |user|

  3.times do
    post = Post.create({
      title: "Demo title",
      content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      photo: "http://static.asiawebdirect.com/m/phuket/portals/phuket-com/homepage/phuket-magazine/freedom-beach/pagePropertiesImage/freedom-beach.jpg"
    })
    user.posts << post
  end
  user.save
end
