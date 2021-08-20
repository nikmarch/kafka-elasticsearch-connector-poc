require 'rest-client'
require 'json'

def search_by_address(address)
  url = 'http://elasticsearch:9200/test_topic/_search?pretty'
  query = {
    "query"=>
    {"multi_match"=>
     {"query"=>address,
      "type"=>"bool_prefix",
      "fields"=>
     ["addresses.full_address",
      "addresses.full_address._2gram",
      "addresses.full_address._3gram"]}}}
  RestClient.post(url, JSON.generate(query), {content_type: :json, accept: :json})
end

puts search_by_address('west loraine')
puts search_by_address('4566 80112')
