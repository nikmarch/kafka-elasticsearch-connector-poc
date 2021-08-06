require 'yaml'
require_relative '../kafka_producer.rb'

pusher = KafkaProducer.new
customers = YAML.load(File.read('customers.yaml'))

customers.map do |customer|
  customer.delete('test_cases')
  pusher.push_customer customer
end
