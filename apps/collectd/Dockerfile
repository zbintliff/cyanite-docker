FROM alpine:3.3
MAINTAINER Core Engineering Development <ced@mlb.com>

RUN apk update && apk add collectd

COPY ./etc/collectd.conf /etc/collectd/collectd.conf
COPY ./etc/collectd.d/10-write_graphite.conf /etc/collectd/collectd.d/10-write_graphite.conf

RUN collectd -tT

ENTRYPOINT [ "collectd" ]
CMD ["-f"]
