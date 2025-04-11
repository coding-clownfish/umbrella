

require "dotenv/load"

pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_key + "/"

#ask the user for their location

pp "Where are you located?"

user_location= gets.chomp.gsub(" ","")

pp user_location

#Get user latitude and longitude from the Google Maps API

maps_url="https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location + "&key="+ ENV.fetch("GMAPS_KEY")
pp maps_url

require "http"

resp = HTTP.get(maps_url)
raw_response = resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")
loc = geo.fetch("location")
latitude = loc.fetch("lat")
longitude = loc.fetch("lng")


#Get the weather at the user’s coordinates from the Pirate Weather AP

weather_url="https://api.pirateweather.net/forecast/"+ ENV.fetch("PIRATE_WEATHER_KEY")+ "/"+ latitude.to_s + "," + longitude.to_s

require "http"
weath = HTTP.get(weather_url)
weather_raw = weath.to_s

require "json"
weather_parsed = JSON.parse(weather_raw)


currently_hash = weather_parsed.fetch("currently")
current_temp = weather_parsed.fetch("temp")

# Some locations around the world do not come with minutely data.
minutely_hash = weather_parsed.fetch("minutely", false)

if minutely_hash
  next_hour_summary = minutely_hash.fetch("summary")

  puts "Next hour: #{next_hour_summary}"
end

hourly_hash = weather_parsed.fetch("hourly")
hourly_data_array = 





#Display the current temperature and summary of the weather for the next hour
