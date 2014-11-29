FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y haproxy
COPY src /code
COPY haproxy-enable /etc/default/haproxy
COPY src/haproxy.default /etc/haproxy/haproxy.cfg
RUN /etc/init.d/haproxy start
CMD cd code && ./dockerproxy
