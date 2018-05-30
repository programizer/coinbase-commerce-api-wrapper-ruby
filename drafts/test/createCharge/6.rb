require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("https://api.commerce.coinbase.com/charges")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"
request["X-Cc-Api-Key"] = "e27e7fca-19ef-4f5d-bd99-84c25656aaf5"
request["X-Cc-Version"] = "2018-03-22"
request.body = JSON.dump({
  "name" => "The Sovereign Individual",
  "description" => "Mastering the Transition to the Information Age",
  "local_price" => {
    "amount" => "100.00",
    "currency" => "USD"
  },
  "pricing_type" => "fixed_price",
  "metadata" => {
    "customer_id" => "id_1005",
    "customer_name" => "Satoshi Nakamoto"
  }
})

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

puts response.code
puts response.body

