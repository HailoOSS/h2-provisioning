#!/bin/sh

bootstrap_file=/opt/hailo/bootstrapped/rabbitmq

if [ ! -f $bootstrap_file ]; then
# Create Default RabbitMQ setup
( sleep 10 ; \

# Create users
# rabbitmqctl add_user <username> <password>
rabbitmqctl add_user hailo hailo ; \

# Set user rights
# rabbitmqctl set_user_tags <username> <tag>
rabbitmqctl set_user_tags hailo administrator ; \

# Set vhost permissions
# rabbitmqctl set_permissions -p <vhostname> <username> ".*" ".*" ".*"
rabbitmqctl set_permissions -p / hailo ".*" ".*" ".*" ; \

touch bootstrap_file ; \
) &
fi
rabbitmq-server $@
