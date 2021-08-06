# Kafka Connect Elasticsearch Sink + Test `search-as-you-type` Full Address searching query and mapping POC

This proof of concept simulate a customer profiles kafka stream connected to Elasticsearch index. It includes end-to-end tests for the setup where Elasticsearch client querying the index and asserts searching relevance results. Here are all steps below:

- docker compose build test environment
- `/lib/seed/test_cases.rb` seeds Kafka `test_topic` with the test customer profiles from `customers.yaml` files.
- `/lib/seed/fake_cases.rb` seeds Kafka `test_topic` with the fake customer profile from `gem "faker", "~> 2.18"`.
- `/lib/build_connector.rb` create index with `mapping.json` custom mapping and create Kafka Elasticsearch Sink connectr from the topic to the index
- Rspec runs searching test cases from `customers.yaml` by searching it by full_address as `search-as-you-type` data type.

## Quick start
To automatically launch the process from docker up to exec rspec run:
```sh
./setup_and_run.sh
```
