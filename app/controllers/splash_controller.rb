class SplashController < ApplicationController
  def index
    @city = City.all

    # render :index
  end
end
