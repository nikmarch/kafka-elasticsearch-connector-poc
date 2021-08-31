require 'json'
require 'rest-client'


def create_connector_for_shop(shop)
  topic = 'test_topic'
  index_name = "#{topic}_for_#{shop}"
  connector_url = "http://kafka_connect:8083/connectors/#{index_name}/config"
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
    "topics" => topic,
    "transforms": "ShopFilter,RenameIndex",
    "transforms.ShopFilter.type": "io.confluent.connect.transforms.Filter\$Value",
    "transforms.ShopFilter.filter.condition": "\$[?(@.shop == '#{shop}')]",
    "transforms.ShopFilter.missing.or.null.behavior": "exclude",
    "transforms.ShopFilter.filter.type": "include",
    "transforms.RenameIndex.type": "org.apache.kafka.connect.transforms.RegexRouter",
    "transforms.RenameIndex.regex": ".*",
    "transforms.RenameIndex.replacement": index_name
  }

  connector_result = RestClient.put(connector_url,
                                    JSON.generate(connector_body),
                                    {content_type: :json, accept: :json})
  puts connector_result
end

create_connector_for_shop 'us'
create_connector_for_shop 'uk'
