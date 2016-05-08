module ApplicationHelper
  def advertisement
    if current_user
      city = advertised_city
      now = (Time.now).strftime("%m/%d/%Y")
      future = (Time.now+604800).strftime("%m/%d/%Y")
      {
        :city => city,
        :link => "https://www.expedia.com/Flights-Search?trip=roundtrip&leg1=from:#{current_user.location},to:#{city},departure:#{now}TANYT&leg2=from:#{city},to:#{current_user.location},departure:#{future}TANYT&passengers=children:0,adults:2,seniors:0,infantinlap:Y&mode=search"
      }
    end
  end
end
