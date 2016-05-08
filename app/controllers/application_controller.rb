class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include InteractionsHelper
  include ApplicationHelper

  # def advertisement
  #   city = advertised_city
  #   now = (Time.now).strftime("%m/%d/%Y")
  #   future = (Time.now+604800).strftime("%m/%d/%Y")
  #   {
  #     :city => city,
  #     :link => "https://www.expedia.com/Flights-Search?trip=roundtrip&leg1=from:#{current_user.location},to:#{city},departure:#{now}TANYT&leg2=from:#{city},to:#{current_user.location},departure:#{future}TANYT&passengers=children:0,adults:2,seniors:0,infantinlap:Y&mode=search"
  #   }
  # end
end
