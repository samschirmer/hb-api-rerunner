require 'httparty'
CSV.read("./#{ARGV[0]}.csv", headers: true).each do |r|
    url = "https://api.hatchbuck.com#{ r['RequestURL'] }"
    headers = { 'Content-Type' => 'application/json' }
    puts "#{ r['APILogId'] }: #{ HTTParty.post(url, headers: headers, body: JSON.parse(r['RequestData']).to_json) }" if r['RequestType'] == 'POST'
    puts "#{ r['APILogId'] }: #{ HTTParty.put(url, headers: headers, body: JSON.parse(r['RequestData']).to_json) }" if r['RequestType'] == 'PUT'
end