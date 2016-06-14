#!/usr/bin/env bash

bootstrap_file=/opt/hailo/bootstrapped/cassandra

if [ -f $bootstrap_file ];
then
    echo "Bootstrapped already"
    exit 0
fi

echo "--- Bootstrapping C* Keyspaces"

while true; do
    cqlsh cassandra 9042 -f /tmp/schema.cql
    [[ $? -eq 0 || $? -eq 2 ]] && break
done

touch $bootstrap_file
