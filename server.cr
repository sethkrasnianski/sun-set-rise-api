require "kemal"
require "./middleware/weather_request"

get "/" do |context|
  context.response.content_type = "application/json"
  context.sun.to_json
end

Kemal.config.add_handler WeatherRequest.new
Kemal.config.port = ENV["PORT"].to_i || 3838
Kemal.run
