#! /bin/bash

docker-compose down && \
  docker-compose up -d && \
  ./setup.sh && \
  echo -e "\nwait for connecor to transfer data to Elasticsearch\n" && \
  sleep 30 && \
  bundle exec rspec
