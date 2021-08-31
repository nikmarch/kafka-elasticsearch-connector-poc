require 'yaml'
require 'kafka'
require 'json'
require 'faker'

class KafkaProducer
  def initialize
    @topic = 'test_topic'
    @kafka = Kafka.new "kafka:19092", client_id: "console_test"
  end

  def push_customer(customer, attempt = 1)
    key = customer.fetch('uuid')
    payload = JSON.generate customer
    @kafka.deliver_message payload, topic: @topic, key: key
    # puts "#{key} published"
  rescue => e # TODO replace by implicit Kafka exception
    if attempt > 5
      raise e
    end
    puts "Kafka Connection error attempt: #{attempt}"
    sleep 5
    push_customer customer, attempt + 1
  end
end
