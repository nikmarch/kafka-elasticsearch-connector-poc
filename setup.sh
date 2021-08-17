#!/bin/bash
echo -e "\Install gems for testing."
bundle install

echo -e "\nWaiting for Elasticsearch."
until $(curl --output /dev/null --silent --head --fail http://elasticsearch:9200); do
    printf '.'
    sleep 1
done

echo -e "\nWaiting for Kafka Connector."
until $(curl --output /dev/null --silent --head --fail http://kafka_connect:8083); do
    printf '.'
    sleep 1
done

echo -e "\nSetup test cases."
bundle exec ruby lib/seed/test_cases.rb

echo -e "\nSetup fake cases."
bundle exec ruby lib/seed/fake_cases.rb

echo -e "\nSetup custom mapping and kafka connector."
bundle exec ruby lib/build_connector.rb
