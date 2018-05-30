require 'net/http'
require 'uri'

uri = URI.parse("https://api.commerce.coinbase.com/events")
request = Net::HTTP::Get.new(uri)
request["X-Cc-Api-Key"] = "e27e7fca-19ef-4f5d-bd99-84c25656aaf5"
request["X-Cc-Version"] = "2018-03-22"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

puts response.code
puts response.body

