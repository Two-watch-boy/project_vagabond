class CitiesController < ApplicationController
  def index
    @city = City.all
    render :index
  end

  def show
    @city = City.find_by_id(params[:id])
    render :show
  end

end
