require 'net/http'
require 'uri'
require 'json'
require 'time'

900.times do


uri = URI.parse("https://api.commerce.coinbase.com/charges")
request = Net::HTTP::Get.new(uri)
request["X-Cc-Api-Key"] = "e27e7fca-19ef-4f5d-bd99-84c25656aaf5"
request["X-Cc-Version"] = "2018-03-22"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# puts response.code
# puts response.body

json = JSON.parse(response.body)

data = json['data']
# puts data
status = data[0]['timeline'][-1]['status']
#time = data[0]['timeline'][-1]['time']
time = data[0]['timeline'][0]['time']
puts status
#puts Time.iso8601(time) < Time.now
#puts Time.iso8601(time)
#puts Time.now
time2 = data[1]['timeline'][-1]['time']
#puts Time.iso8601(time2)
#puts Time.iso8601(time) > Time.iso8601(time2)
time=Time.iso8601(time)
time2=Time.iso8601(time2)
now=Time.now

puts now-time
if now-time<15*60
  puts 'ok'
else
  puts 'not ok'
end
sleep(1)


end
