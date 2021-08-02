# Kafka Connect Elasticsearch Proof of Concept

Here is a POC for Kafka connector for Elasticsearch Sink.
The test data and fake data generated to the `test_topic` in Kafka and picked up by connector and pushed down to Elasticsearch index where Rspec tests the passed data by searching it by full_address as `search-as-you-type` data type.

## Quick start
to quickly seed the data and run the tests do:
```sh
docker-compose down && docker-compose up -d && ./setup.sh && sleep 30 && bundle exec rspec
```
