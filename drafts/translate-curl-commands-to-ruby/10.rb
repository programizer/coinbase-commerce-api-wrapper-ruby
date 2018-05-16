require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("https://api.commerce.coinbase.com/checkouts/30934862-d980-46cb-9402-43c81b0cabd5")
request = Net::HTTP::Put.new(uri)
request.content_type = "application/json"
request["X-Cc-Api-Key"] = "<Your API Key>"
request["X-Cc-Version"] = "2018-03-22"
request.body = JSON.dump({
  "local_price" => {
    "amount" => "200.00",
    "currency" => "USD"
  }
})

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body

