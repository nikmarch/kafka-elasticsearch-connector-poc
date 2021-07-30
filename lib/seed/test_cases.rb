require 'yaml'
require_relative '../kafka_producer.rb'

pusher = KafkaProducer.new
customers = YAML.load(File.read('./lib/customers.yaml'))

customers.map do |customer|
  pusher.push_customer customer
end
