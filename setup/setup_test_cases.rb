require 'yaml'
require_relative '../lib/kafka_producer.rb'

pusher = KafkaProducer.new
customers = YAML.load(File.read('../test_cases/customers.yaml'))

customers.map do |customer|
  customer.delete('test_cases')
  pusher.push_customer customer
end
