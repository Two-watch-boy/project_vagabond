# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
User.destroy_all

random_cities = ["San Francisco","London","Gibraltar","Beijing"]

user_data = []

5.times do
  first = "I like"
  last = random_cities[rand(3)]
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

cities = [
  {
    name: "San Francisco",
    photo: "http://static1.squarespace.com/static/5137999fe4b037a1b7ece5d5/568ed3c8a2bab85e9211c788/54bb5889e4b06fad9b9bb5cd/1421564049060/IMG_1286.jpg?format=1500w",
    lat: 37.7749,
    lon: -122.4194
  },
  {
    name: "Gibraltar",
    photo: "http://www.winwallpapers.net/w1/2012/06/gibraltar-a-view-from-above.jpg",
    lat: 36.1408,
    lon: -5.3536
  },
  {
    name: "London",
    photo: "http://www.kayture.com/wp-content/uploads/2015/08/london22.jpg",
    lat: 51.5074,
    lon: -0.1278
  },
  {
    name: "Beijing",
    photo: "https://images4.alphacoders.com/592/592819.jpg",
    lat: 39.9042,
    lon: 116.4074
  }
]

created_cities = City.create(cities)


users.each do |user|

  3.times do
    post = Post.create({
      title: "Demo title",
      content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      photo: "http://static.asiawebdirect.com/m/phuket/portals/phuket-com/homepage/phuket-magazine/freedom-beach/pagePropertiesImage/freedom-beach.jpg"
    })
    created_cities.each do |city|
      if city.name === user.last_name
        city.posts << post
        city.save
      end
    end
    user.posts << post
  end
  user.save
end
