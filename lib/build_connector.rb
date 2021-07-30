require 'rest-client'

mapping_url = 'http://localhost:9200/test_topic'
mapping_results = RestClient.put(mapping_url, File.read('./lib/mapping.json'), {content_type: :json, accept: :json})
puts mapping_results

connector_url = 'http://localhost:8083/connectors/test_topic/config'
connector_result = RestClient.put(connector_url, File.read('./lib/connector.json'), {content_type: :json, accept: :json})
puts connector_result
