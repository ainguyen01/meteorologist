require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

lat=@lat
lng=@lng
location=lat,lng
location_string=location.join(",")
url2="https://api.darksky.net/forecast/39eea474a070fb4ea81839e67bbe3603/"
website2=url2.insert 66, location_string


parsed_data2=JSON.parse(open(website2).read)
current_summ =parsed_data2["currently"]["summary"]
current_temp= parsed_data2["currently"]["temperature"]
hour_summ= parsed_data2["hourly"]["summary"]
day_summ=parsed_data2["daily"]["summary"]
minute_summ=parsed_data2["minutely"]["summary"]


    @current_temperature = current_temp

    @current_summary = current_summ

    @summary_of_next_sixty_minutes = minute_summ

    @summary_of_next_several_hours = hour_summ

    @summary_of_next_several_days = day_summ

    render("forecast/coords_to_weather.html.erb")
  end
end
