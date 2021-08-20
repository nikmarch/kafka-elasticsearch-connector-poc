#! /bin/bash
echo -e "\nDestroy old docker environment\n" && \
  docker-compose down && \
  echo -e "\nBuild new docker environment\n" && \
  docker-compose up -d  --build && \
  echo -e "\nRun data provisioners\n" && \
  docker-compose exec rspec ./setup.sh
