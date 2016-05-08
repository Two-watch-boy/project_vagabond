class CitiesController < ApplicationController
  def index
    @city = City.all
    render :index
  end

  def show
    @city = City.find_by_id(params[:id])
    @posts = @city.posts.order(:created_at)
    render :show
  end

  def new
    @city = City.new
  end

  def create
    
  end
end
