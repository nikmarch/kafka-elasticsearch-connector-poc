require_relative '../kafka_producer.rb'
require 'faker'
require 'securerandom'

def generate_fake_customer
  {
    'uuid' => SecureRandom.uuid,
    'email' => Faker::Internet.email,
    'addresses' => [
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"}
    ]
  }
end

pusher = KafkaProducer.new

200.times.map do
  pusher.push_customer generate_fake_customer
end

