require 'yaml'
require 'kafka'
require 'json'
require 'faker'

class KafkaPusher
  def initialize
    @topic = 'test_topic'
    @kafka = Kafka.new "localhost:9092", client_id: "console_test"
  end

  def push_customer(customer)
    puts customer
    key = customer.fetch('uuid')
    payload = JSON.generate customer
    puts payload

    @kafka.deliver_message payload, topic: @topic, key: key
  end
end

def generate_fake_customer
  {
    'uuid' => `uuidgen`.chop,
    'email' => Faker::Internet.email,
    'addresses' => [
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"}
    ]
  }
end

pusher = KafkaPusher.new
customers = YAML.load(File.read('./lib/customers.yaml'))

customers.map do |customer|
  pusher.push_customer customer
end

100.times.map do
  pusher.push_customer generate_fake_customer
end

