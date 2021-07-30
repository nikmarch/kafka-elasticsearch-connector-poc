require_relative '../kafka_producer.rb'
require 'faker'

def generate_fake_customer
  {
    'uuid' => `uuidgen`.chop, # TODO: replace with gem or library
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

100.times.map do
  pusher.push_customer generate_fake_customer
end

