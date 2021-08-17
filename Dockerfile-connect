FROM confluentinc/cp-kafka-connect:5.5.4

ENV KAFKA_HEAP_OPTS="-Xms512m -Xmx1g"

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest
RUN confluent-hub install --no-prompt confluentinc/connect-transforms:latest
