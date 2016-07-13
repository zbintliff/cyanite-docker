docker-cyanite
============
THIS REPO INCLUDES A JAR JUST FOR TESTING. WE WILL HAVE TO REMOVE IT IF WE CONTINUE TO USE IT AND INSTALL FROM ARTIFACTORY

1. Clone Repo
2. Run `./test/startup.sh`

This creates a Cassandra node, sets the schema, a cyanite node, a graphite-api node with the cyanite plugin, then a grafana node.

You should be able to login to the grafan UI via `localhost:3000` using admin/admin as u/p. Then configure the data source with `http://graphite-api:8000`.
