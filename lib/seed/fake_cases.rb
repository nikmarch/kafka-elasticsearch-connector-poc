require_relative '../kafka_producer.rb'
require 'faker'
require 'securerandom'

def generate_fake_customer(shop)
  {
    'uuid' => SecureRandom.uuid,
    'email' => Faker::Internet.email,
    'shop' => shop,
    'addresses' => [
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"},
      {'full_address' => "#{Faker::Name.name} #{Faker::Address.full_address}"}
    ]
  }
end

pusher = KafkaProducer.new

puts "\nFake customers for US\n"
1000.times.map do
  pusher.push_customer generate_fake_customer('us')
end

puts "\nFake customers for UK\n"
1000.times.map do
  pusher.push_customer generate_fake_customer('uk')
end

