require 'rest-client'
require 'json'

def search_by_full_address(address)
  url = 'http://localhost:9200/test_topic/_search?pretty'
  query = {
    "query"=>
    {"multi_match"=>
     {"query"=>address,
      "type"=>"bool_prefix",
      "operator"=>"and",
      "fields"=>
     ["addresses.full_address",
      "addresses.full_address._2gram",
      "addresses.full_address._3gram"]}}}
  response = RestClient.post(
    url,
    JSON.generate(query),
    {content_type: :json, accept: :json}
  )

  JSON.parse(response.body).fetch('hits').fetch('hits')
end