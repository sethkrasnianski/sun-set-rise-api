require "json"
require "kemal"
require "./middleware/weather_request"

get "/" do |env|
  env.response.content_type = "application/json"
  env.sun.to_json
end

Kemal.config.add_handler WeatherRequest.new
Kemal.config.port = 3838
Kemal.run
