# Write your solution below!
#source "https://rubygems.org"
#gem "dotenv"

require "http"
require "dotenv/load"
require "json"

pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_key + "/"

#ask the user for their location

pp "Where are you located?"
user_location= gets.chomp
pp user_location

#Get user latitude and longitude from the Google Maps API

maps_url="https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location + "&key="+ ENV.fetch("GMAPS_KEY")
pp maps_url
 

#Get the weather at the user’s coordinates from the Pirate Weather AP

#Display the current temperature and summary of the weather for the next hour
