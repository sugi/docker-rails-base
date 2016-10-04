## sugi's rails base image

Base image for isolate rails application into docker.

### Deploy

Please refer [capistrano-deploy\_into\_docker](https://github.com/sugi/capistrano-deploy_into_docker) to deploy with capistrano.

You need to deploy application to /app (and linked /app/current) by capistrano style with user `rails:rails` on default.
Application uid/gid can be changed on runtime.

### Environment variables

Following variables can be changed on runtime.

* APP\_UID (default: 3000)
* APP\_GID (default: 3000)
* APP\_HOME\_DIR (default: /app)
* APP\_CURRENT\_DIR (default: /app/current)
* APP\_SERVER\_CMD (default: exec bin/rails server -b0)
