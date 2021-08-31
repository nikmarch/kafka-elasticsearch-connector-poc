require 'rest-client'

def create_mapping_for_shop(shop)
  topic = 'test_topic'
  mapping_url = "http://elasticsearch:9200/#{topic}_for_#{shop}"
  mapping_results = RestClient.put(mapping_url, File.read('./setup/mapping.json'), {content_type: :json, accept: :json})
  puts mapping_results
end

create_mapping_for_shop 'us'
create_mapping_for_shop 'uk'

