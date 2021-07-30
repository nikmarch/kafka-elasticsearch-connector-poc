require 'yaml'
require 'kafka'
require 'json'
topic = 'test_topic'

kafka = Kafka.new "localhost:9092", client_id: "console_test"
customers = YAML.load(File.read('./lib/customers.yaml'))

customers.map do |customer|
  key = customer.fetch('uuid')
  payload = JSON.generate customer
  puts payload
  kafka.deliver_message payload, topic: topic, key: key
end

