require 'kafka'

kafka = Kafka.new "localhost:9092", client_id: "console_test"
kafka.deliver_message "Hi Nik", topic:'console_test', key: 'lol'
