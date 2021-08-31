# Kafka Connect Elasticsearch Sink + Test `search-as-you-type` Full Address searching query and mapping POC

This proof of concept simulate a customer profiles kafka stream connected to Elasticsearch index. It includes end-to-end tests for the setup where Elasticsearch client querying the index and asserts searching relevance results. Here are all steps below:

- docker compose build test environment
- `/setup/setup_test_cases.rb` seeds Kafka `test_topic` with the test customer profiles from `customers.yaml` files.
- `/setup/setup_fake_cases.rb` seeds Kafka `test_topic` with the fake customer profile from `gem "faker", "~> 2.18"`.
- `/setup/setup_mappings.rb` create index with `mapping.json` custom mapping.
- `/setup/setup_connectors.rb` create Kafka Elasticsearch Sink connector from the topic to the index
- Rspec runs searching test cases from `/test_cases/customers.yaml` by searching it by full_address as `search-as-you-type` data type.

## Quick start
To automatically launch the process from docker up to exec rspec run:
```sh
./scripts/run.sh
```

## Test Cases
When reported about an issue with searching result relevance, create a new test case with expected profile to be found and query required to find it:
```yaml
- uuid: 7CFA44CC-7149-4496-B0D1-8933C0616139
  shop: us
  addresses:
    - full_address: John Doe 123 first St. Apt A San Jose CA, 20112
    - full_address: John Doe 4566 2nd St. Apt A Springfield WA, 80112
  test_cases:
    - john doe 20112
    - john doe second street 80112
```
