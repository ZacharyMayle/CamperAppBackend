require 'pry'
require 'rest-client'



parks = RestClient.get "https://developer.nps.gov/api/v1/parks?stateCode=CO&api_key=3h90U6sxs7uzFVrhFU5PBItP0XZKV2cJWikfOeE5"
parsed_json = JSON.parse(parks)
parsed_parks = parsed_json["data"].map do |parsed_json|
    {name: parsed_json["name"], code: parsed_json["parkCode"]}
end
binding.pry