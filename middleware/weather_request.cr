require "http/client"
require "json"

class HTTP::Server::Context
  property! sun : Hash(Symbol, JSON::Any)
end

class WeatherRequest < HTTP::Handler
  def call(context)
    external_response = HTTP::Client.get("http://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400")
    body = JSON.parse(external_response.body)

    context.sun = {
      :rises => body["results"]["sunrise"],
      :sets  => body["results"]["sunset"],
    }

    call_next context
  end
end
