#! /bin/bash
echo -e "\nDestroy old docker environment\n" && \
  docker-compose down && \
  echo -e "\nBuild new docker environment\n" && \
  docker-compose up -d
  # echo -e "\nRun data provisioners\n" && \
  # ./setup.sh && \
  # echo -e "\nWait for connecor to transfer data to Elasticsearch\n" && \
  # sleep 30 && \
  # echo -e "\nRun searching test cases\n" && \
  # bundle exec rspec
