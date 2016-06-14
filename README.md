# H2-Provisioning

Automated provisioning of the H2 platform with Docker.

# Requirements:

* docker 1.11 or greater
* docker-compose 1.7.1 or greater

# Instructions
```
git clone https://github.com/hailocab/H2-provisioning.git ~/h2-provisioning
cd ~/h2-provisioning
make

```
This will take approx 10min to build.
Once provisioning has completed you will have a fully functional H2 platform
available locally.

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
