
puts "="*40
puts "       Where are you located?"
puts "="*40
user_location=gets.chomp.gsub(" ","%20")
#user_location="chicago"
puts "Checking the weather at #{user_location}...." 

#FOR THE LOCATION
maps_url="https://maps.googleapis.com/maps/api/geocode/json?address="+ user_location+"&key="+ ENV.fetch("GMAPS_KEY")


require "http"

resp= HTTP.get(maps_url)

raw_response= resp.to_s


require "json"
parsed_response= JSON.parse(raw_response)

results= parsed_response.fetch("results")

first_result= results.at(0)

geo= first_result.fetch("geometry")

loc= geo.fetch("location")
latitude= loc.fetch("lat")
longitude= loc.fetch("lng")
puts "Your coordinates are #{latitude}, #{longitude}." 








#FOR tHE WEATHER
pirate_weather_url = "https://api.pirateweather.net/forecast/"+ENV.fetch("PIRATE_WEATHER_KEY") +"/41.8887,-87.6355"

resp1= HTTP.get(pirate_weather_url)

raw_response1= resp1.to_s


require "json"
parsed_response1= JSON.parse(raw_response1)

results1= parsed_response1.fetch("currently")

temp=results1.fetch("temperature")
puts "It is currently #{temp}."

results2= parsed_response1.fetch("hourly")
puts results2



#Next hour: Possible light rain starting in 25 min.












=begin
# I've already created a string variable above: pirate_weather_api_key
# It contains sensitive credentials that hackers would love to steal so it is hidden for security reasons.
require "http"

pirate_weather_api_key=ENV.fetch("PIRATE_WEATHER_KEY")

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/"+pirate_weather_api_key+"/41.8887,-87.6355"

# Place a GET request to the URL
raw_response = HTTP.get(pirate_weather_url)

require "json"

parsed_response = JSON.parse(raw_response)

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "The current temperature is " + current_temp.to_s + "."
=end
