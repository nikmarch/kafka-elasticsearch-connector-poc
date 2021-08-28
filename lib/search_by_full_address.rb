require 'rest-client'
require 'json'

def search_by_full_address(searchable_address, shop)
  url = "http://elasticsearch:9200/test_topic_for_#{shop}/_search?pretty"
  query = {
    "query"=>
    {"multi_match"=>
     {"query"=>searchable_address,
      "type"=>"bool_prefix",
      "operator"=>"and",
      "fuzziness"=> 1,
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
