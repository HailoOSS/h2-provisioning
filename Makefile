# The name of the compose project - h2_default
project_name?=h2

# This is the list of the compose files to import: Override this with a list
# of the files you want to build. E.g make compose_files=infra to only build the
# shared infrastructure containers. Useful if you plan on starting the kernel
# services manually
compose_files?=infra kernel
compose_file_args = $(patsubst %,-f docker-compose.%.yml,$(compose_files))

# Create the `docker login`command to get access to the private docker registry
docker_login_cmd := $(shell aws ecr --profile=prod get-login)

all : down up

.PHONY : all

login:
	$(docker_login_cmd)

up : login
	docker-compose -f docker-compose.yml $(compose_file_args) \
		--project-name ${project_name} \
		up --build

down :
	docker-compose -f docker-compose.yml $(compose_file_args) \
		--project-name ${project_name} \
		down

# Clean purges the entire setup giving you a fresh start
clean : down
	rm -rf ./data/cassandra/* \
		./data/rabbitmq/* \
		./data/opt/hailo/var/log/* \
		./data/opt/hailo/bootstrapped/*
