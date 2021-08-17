require 'json'
require 'rest-client'

topic = 'test_topic'

mapping_url = 'http://elasticsearch:9200/test_topic'
mapping_results = RestClient.put(mapping_url, File.read('./lib/mapping.json'), {content_type: :json, accept: :json})
puts mapping_results

connector_url = 'http://kafka_connect:8083/connectors/test_topic/config'
connector_body = {
  "connector.class" => "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
  "connection.url" => "elasticsearch:9200",
  "read.timeout.ms" => 600000,
  "tasks.max" => "1",
  "type.name" => "_doc",
  "key.converter" => "org.apache.kafka.connect.storage.StringConverter",
  "value.converter" => "org.apache.kafka.connect.json.JsonConverter",
  "value.converter.schemas.enable" => false,
  "behavior.on.malformed.documents" => "warn",
  "behavior.on.null.values" => "delete",
  "drop.invalid.message" => true,
  "topics" => topic
}

connector_result = RestClient.put(connector_url,
                                  JSON.generate(connector_body),
                                  {content_type: :json, accept: :json})
puts connector_result
