class CitiesController < ApplicationController
  def index
    @city = City.all
    render :index
  end

  def show
    @city = City.find_by_id(params[:id])
    @posts = @city.posts.order(:created_at)
    interact(1,@city)
    render :show
  end

  def new
    if !is_premium?
      flash[:error] = "You need to switch to premium to do this."
      redirect_to edit_path(current_user)
    end
    @city = City.new
  end

  def create
    if is_premium?
      queried_city = params[:city][:name]
      city_info = get_city_info queried_city
      city_info[:photo] = get_photo city_info[:name]
      puts(city_info)
      @city = City.new(city_info)
      if @city.save
        interact(3,@city)
        flash[:notice] = "New city #{@city.name} created"
        redirect_to city_path(@city)
      else
        flash[:error] = "Error in creaating new city."
        redirect_to new_city_path
      end
    else
      flash[:error] = "You need to switch to premium to do this."
      redirect_to edit_path(current_user)
    end
  end

  private

  def get_city_info city
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&key=#{ENV['secret_google_code']}"
    res = HTTParty.get(url)
    city = {
      :name => JSON.parse(res.body)["results"][0]["address_components"][0]["long_name"],
      :lat => JSON.parse(res.body)["results"][0]["geometry"]["location"]["lat"],
      :lon => JSON.parse(res.body)["results"][0]["geometry"]["location"]["lng"]
    }
  end
  def get_photo city
    res = HTTParty.get("https://api.500px.com/v1/photos/search",
    :query => {:term => city,
      :image_size => 1600,
      :only => "City_and_Arcitecture,Landscapes",
      :consumer_key => "y9c9CO3ZyoNLobxpxZxGxn40e08RF5dwkf8Vmh5M"})
    image = JSON.parse(res.body)["photos"][0]["image_url"]
  end
end
