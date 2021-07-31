require 'yaml'
require 'kafka'
require 'json'
require 'faker'

class KafkaProducer
  def initialize
    @topic = 'test_topic'
    @kafka = Kafka.new "localhost:9092", client_id: "console_test"
  end

  def push_customer(customer)
    key = customer.fetch('uuid')
    payload = JSON.generate customer
    @kafka.deliver_message payload, topic: @topic, key: key
    puts "#{key} published"
    # puts payload
  end
end
