docker-cyanite
============

1. Clone Repo
2. Run `docker-compose up -d`
3. Wait 10 seconds run `docker-compose up -d` again (this sets the schema and starts cyanite. both fail while cassandra is up but not listening yet during first command and didn't feel like wasting time on this)
4. You now how a running cyanite instance `cyanite_cyanite_1` and cassandra instance `cyanite_cassandra_1`.  Cyanite logs are set to `TRACE` for now.
5. You should be able to insert metrics like with the following command:
```
echo "<metric> <value> `date +%s`" | nc -vc localhost 2003
6. If you want to query the cassandra database you can use cql by running the following command:
```
docker run -it --net=cyanite_cyanite  --rm cassandra:3.0 cqlsh cyanite_cassandra_1
```

Have not been able to write metrics successfully yet, but if I do the above `echo` command and add one too many fields I see cyanite stack trace that it was bad format, meaning that it *IS* getting the data.
