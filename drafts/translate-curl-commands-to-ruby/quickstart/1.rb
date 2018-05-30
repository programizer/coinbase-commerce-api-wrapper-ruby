require 'net/http'
require 'uri'

uri = URI.parse("https://api.commerce.coinbase.com/charges/")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"
request["X-Cc-Api-Key"] = "YOUR_API_KEY"
request["X-Cc-Version"] = "2018-03-22"
request.body = ""
request.body << File.read("data.json").delete("\r\n")

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body

