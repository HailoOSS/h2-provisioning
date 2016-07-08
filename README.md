# H2-Provisioning

Automated provisioning of the H2 platform with Docker.

# Requirements:

* awscli version 1.10 or greater
* docker 1.11 or greater
* [docker for mac](https://docs.docker.com/engine/installation/mac/)
* docker-compose 1.7.1 or greater

You should also have the file `~/.aws/credentials` which contains:
```
[default]
aws_access_key_id = [DevAccountAccessKeyId]
aws_secret_access_key = [DevAccountSecretKey]
[prod]
aws_access_key_id = [ProdAccountAccessKeyId]
aws_secret_access_key = [ProdAccountSecretKey]
```
Also the file `~/.aws/config` should contain:
```
[default]
region = eu-west-1
[profile prod]
region = eu-west-1
```

# Instructions
```
git clone https://github.com/hailocab/H2-provisioning.git ~/h2-provisioning
cd ~/h2-provisioning
make
```
This will take approx 10min to build.
Once provisioning has completed you will have a fully functional H2 platform
available locally.

Connect via `hshell`:
```
hshell
h2o Interactive Shell
> host localhost
Connecting to amqp://hailo:hailo@localhost:5672
> ls
Services:
   com.hailocab.kernel.discovery
   com.hailocab.service.config
   com.hailocab.service.login
>
```

* Username: admin
* Password: Password1

## TODO:

- [x] Add kernel services (config / discovery / login)
- [x] Pull kernel service images from AWS ECR?
    - [x] Build kernel services in CI phase
- [ ] Add thin-api (http2rpc)
- [ ] Add web-app support
- [ ] Clean up bootstrapping
- [ ] Dynamically generate public/private-key pair
