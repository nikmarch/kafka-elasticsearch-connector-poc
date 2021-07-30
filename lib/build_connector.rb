require 'rest-client'

mapping_url = 'http://localhost:9200/test_index'
res = RestClient.put(mapping_url, File.read('./lib/mapping.json'), {content_type: :json, accept: :json})
puts res
