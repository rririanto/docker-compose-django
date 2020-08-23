# docker-compose-django
This is a Docker setup for a web application based on Django.

- The Django application is served by Gunicorn (WSGI application).
- We use nginx-proxy as reverse proxy and static files server. 
- Static and media files are persistently stored in volumes.
- Python dependencies are managed through pip requirement.txt

## Motivation
I've using docker almost in all of my Django projects. There's a lot starter or example to use docker to run the Django web framework available on Github. However, I have my own settings that make my job more flexible and easier, and I would love to share it. So anyboday can get inspired. 

## Prerequisite
- [Docker & Docker-compose](https://runnable.com/docker/install-docker-on-windows-10)

## Configurations
This project has a default host localhost, if you like to deploy it to your server you need to update this configuration:

HTTPS settings on [docker-compose file](https://github.com/rririanto/docker-compose-django/blob/master/docker-compose.yaml)

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

## How to use
We use Makefile to make our life easy. You can see the command list on [Makefile](https://github.com/rririanto/docker-compose-django/blob/master/Makefile) file. 
However, this is the first things to do to run this project: 

1. We need to create volumes to store files persistently.
```sh
make create-volume
```
2. Run nginx-proxy 
```
make up-nginx
```
3. Build our web
```
make build
```

## Thank you
This project was inspired from:
- [pawamoy](https://github.com/pawamoy/docker-nginx-postgres-django-example)
- [testdriven](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)

## Contact me
rahmat.ramadhaniriyanto@gmail.com
