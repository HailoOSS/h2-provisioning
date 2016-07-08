#!/usr/bin/env bash

# Disable virtual nodes
sed -i -e "s/num_tokens/\#num_tokens/" $CASSANDRA_CONFIG/cassandra.yaml
sed -i -e "s|commitlog_directory=.*|commitlog_directory=/tmp" $CASSANDRA_CONFIG/cassandra.yaml
# Pointless in one-node cluster, saves about 5 sec waiting time
echo "JVM_OPTS=\"\$JVM_OPTS -Dcassandra.skip_wait_for_gossip_to_settle=0\"" >> $CASSANDRA_CONFIG/cassandra-env.sh

