FROM cassandra:2.1.8

ADD schema.cql /tmp/schema.cql

ADD scripts/cassandra-bootstrap.sh /cassandra-bootstrap
RUN chmod +x /cassandra-bootstrap

ADD scripts/cassandra-singlenode.sh /cassandra-singlenode
RUN chmod +x /cassandra-singlenode
RUN /cassandra-singlenode
