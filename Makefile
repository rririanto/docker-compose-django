create-volume:
	docker volume create --name=static && docker volume create --name=media

create-network:
	docker network create nginx-proxy

build:
	docker-compose up -d --build
	
up:
	docker-compose up -d

up-test:
	docker-compose up

up-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml up -d

up-test-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml up

start:
	docker-compose start

stop:
	docker-compose stop

start-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml start

stop-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml stop

down-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml down

restart:
	docker-compose stop && docker-compose start

restart-nginx:
	docker-compose -f nginx-proxy/docker-compose.yaml stop && docker-compose -f nginx-proxy/docker-compose.yaml start

shell-nginx:
	docker exec -ti nginx /bin/sh

shell-web:
	docker exec -ti dev /bin/sh

shell-db:
	docker exec -ti db /bin/sh

log-nginx:
	docker-compose logs nginx  

log-web:
	docker-compose logs web  

log-db:
	docker-compose logs db

collectstatic:
	docker exec dev /bin/sh -c "python manage.py collectstatic --noinput"  

migrate:
	docker exec dev /bin/sh -c "python manage.py makemigrations && python manage.py migrate"

createsuperuser:
	docker-compose run web python manage.py createsuperuser

rebuild:
	sh rebuild_web.sh
