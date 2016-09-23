require "json"
require "kemal"

get "/" do |env|
  env.response.content_type = "application/json"
  {test: "works"}.to_json
end

Kemal.config.port = 3838
Kemal.run
