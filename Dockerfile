FROM java:8-alpine
MAINTAINER CoreEngineering Development <ced@mlb.com>

COPY etc/cyanite.yaml /etc/cyanite.yaml
COPY opt/cyanite /opt/cyanite/


EXPOSE 2003 8080

ENTRYPOINT [ "java", "-jar", "/opt/cyanite/cyanite-0.5.1-standalone.jar" ]
