require 'yaml'
require 'kafka'
require 'json'
require 'faker'

class KafkaProducer
  def initialize
    @topic = 'test_topic'
    @kafka = Kafka.new "kafka:9092", client_id: "console_test"
  end

  def push_customer(customer, attempt = 1)
    key = customer.fetch('uuid')
    payload = JSON.generate customer
    @kafka.deliver_message payload, topic: @topic, key: key
    puts "#{key} published"
    # puts payload
  rescue Kafka::LeaderNotAvailable => e
    if attempt > 3
      raise e
    end
    puts "Kafka Connection error attempt: #{attempt}"
    sleep 2
    push_customer customer, attempt + 1
  end
end
