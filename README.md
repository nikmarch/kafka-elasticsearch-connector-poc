# Kafka Connect Elasticsearch Proof of Concept

Here is a POC for Kafka connector for Elasticsearch Sink:

- The test case customer profiles and fake customer profiles are generated to the `test_topic` in Kafka from `customers.yaml`.
- The fake customer profiles are generated to the `test_topic` in Kafka.
- The profiles are picked up by connector
- The connector pushes profiles down to Elasticsearch index
- Rspec runs searching test cases from `customers.yaml` by searching it by full_address as `search-as-you-type` data type.

## Quick start
to quickly seed the data and run the tests do:
```sh
docker-compose down && docker-compose up -d && ./setup.sh && sleep 30 && bundle exec rspec
```
