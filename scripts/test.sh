#!/bin/bash

## Start the containers, wait for Cassandra to Bootstrap then start cyanite
echo "Launching Cyanite and Cassandra, will take about 40 seconds"
docker-compose up -d && sleep 20 && docker-compose up -d && sleep 20

echo "Inserting Data into Cyanite"
echo "test.wait.1 15 `date +%s`" | nc -w 1 localhost 2003
echo "test.wait.5 15 `date +%s`" | nc -w 5 localhost 2003
echo "test.no.wait 15 `date +%s`" | nc localhost 2003
echo "test.with.c 15 `date +%s`" | nc -c localhost 2003
echo "test.with.different.echo "$(date +%s) | nc -c localhost 2003

echo "Granularity is set to 5 seconds.  Going to wait 10 seconds to ensure data has chance to get into Cassandra"
sleep 10

echo "Querying Cassandra Database"
docker run -it --net=cyanite_cyanite  --rm cassandra:3.0 cqlsh cyanite_cassandra_1 -e 'select * from metric.metric; select * from metric.path;'

echo "Removing Containers"
docker-compose down
