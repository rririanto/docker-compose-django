# docker-compose-django
This is a Docker setup for a web application based on Django.

- The Django application is served by Gunicorn (WSGI application).
- We use nginx-proxy as reverse proxy and static files server. 
- SSL/HTTPS automatic generate and renew using [letsencrypt-nginx-proxy-companion](https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion/)
- Static and media files are persistently stored in volumes.
- Python dependencies are managed through pip requirement.txt

## Motivation
I've using docker almost in all of my Django projects. There's a lot starter or example to use docker to run the Django web framework available on Github. However, I have my own settings that make my job more flexible and easier, and I would love to share it. So anyboday can get inspired. 

## Prerequisite
- [Docker & Docker-compose](https://runnable.com/docker/install-docker-on-windows-10)

## Configurations
This project has a default host localhost, if you like to deploy it to your server you need to update this configuration:
1. HTTPS settings on [docker-compose file](https://github.com/rririanto/docker-compose-django/blob/master/docker-compose.yaml)

```
VIRTUAL_HOST: yourdomain.com
VIRTUAL_PORT: 80
LETSENCRYPT_HOST: yourdomain.com
#Email use to register yourdomain.com to Letsencrypt
LETSENCRYPT_EMAIL: youremail@gmail.com
```
Note: 
- Once you enable LETSENCRYPT_HOST & LETSENCRYPT_EMAIL the nginx-proxy will be automaticly generate https cert for you. simple right?
- Ignore this settings if you just want to run it in your localhost

2. [Dock-gen](https://github.com/jwilder/docker-gen) for nginx configuration

I'm using dock-gen to generate Nginx settings from the template. So whenever I want to create demo, test, production, implement DTAP software development or create any subdomain with other containers, I don't need to do it manually. If you want to edit & add new route, caching config and etc, please do it on [nginx.tmpl](https://github.com/rririanto/docker-compose-django/blob/master/nginx-proxy/nginx.tmpl#L384)

3. Use Alpine-linux

The default configuration is not using Alpine. However, if you want to use Alpine and reduce the size of your container, you can change the DockerFile to [Dockerfile-alpine](https://github.com/rririanto/docker-compose-django/blob/master/Dockerfile-alpine). Take a look on [docker-compose](https://github.com/rririanto/docker-compose-django/blob/master/docker-compose.yaml#L19) and change Dockerfile to Dockerfile-alpine
```
  web:
    build:
      context: .
      dockerfile: Dockerfile-alpine

```


## How to use
We use Makefile to make our life easy. You can see the command list on [Makefile](https://github.com/rririanto/docker-compose-django/blob/master/Makefile) file. 
However, this is the first things to do to run this project: 

1. Create nginx-proxy network
```sh
make create-network
```

2. Create volumes to store files persistently.
```sh
make create-volume
```
3. Run nginx-proxy 
```
make up-nginx
```
4. Build the Django web
```
make build
```

## Thank you
This project was inspired from:
- [pawamoy](https://github.com/pawamoy/docker-nginx-postgres-django-example)
- [testdriven](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)

## Contact me
rahmat.ramadhaniriyanto@gmail.com
