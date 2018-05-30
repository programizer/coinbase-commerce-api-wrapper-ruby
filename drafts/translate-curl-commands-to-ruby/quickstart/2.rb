require 'net/http'
require 'uri'

uri = URI.parse("https://api.commerce.coinbase.com/charges/2E8YCQWQ")
request = Net::HTTP::Get.new(uri)
request["X-Cc-Version"] = "2018-03-22"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body

