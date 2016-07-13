#!/bin/bash

## Start the containers, wait for Cassandra to Bootstrap then start cyanite
echo "Launching Cyanite and Cassandra, will take about 40 seconds"
docker-compose up -d && sleep 20 && docker-compose up -d && sleep 20

