require 'net/http'
require 'uri'

uri = URI.parse("https://api.commerce.coinbase.com/events/24934862-d980-46cb-9402-43c81b0cdba6")
request = Net::HTTP::Get.new(uri)
request["X-Cc-Api-Key"] = "<Your API Key>"
request["X-Cc-Version"] = ""

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body

