#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'net/http'

query_url = 'http://www.google.com/search?q=%s&btnI'
query = ARGV.length > 0 ? URI::encode(ARGV.join ' ') : URI::encode(ARGF.read)

uri =      URI::parse(sprintf(query_url, query))
http =     Net::HTTP.new(uri.host, uri.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))

if '302' == response.code
  system "/usr/bin/env", "open", response['location']
else
  warn "# You No Lucky!"
end
