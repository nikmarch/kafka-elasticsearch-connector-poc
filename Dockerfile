FROM confluentinc/cp-kafka-connect:latest

ENV KAFKA_HEAP_OPTS="-Xms512m -Xmx1g"

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest
RUN confluent-hub install --no-prompt confluentinc/connect-transforms:latest
