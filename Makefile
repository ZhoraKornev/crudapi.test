.SILENT:

include .env

dc = docker-compose -p ${APP_NAME}

web = web
php = php
db = db
node = node

bridge = ${DOCKER_BRIDGE}
port = ${DOCKER_WEB_PORT}

http_address = "http://$(bridge):$(port)"

build:
	$(dc) up --build --force-recreate -d
	echo $(http_address)

init:
#	$(dc) up --build --force-recreate -d
	$(dc) run --rm $(php)
#	 /usr/local/bin/composer install
	$(node) npm i
	echo $(http_address)

start:
	$(dc) start
	echo $(http_address)

stop:
	$(dc) stop

down:
	$(dc) down

logs:
	$(dc) logs

logs_f:
	$(dc) logs -f

ps:
	$(dc) ps

php_bash:
	$(dc) exec $(php) bash

db_bash:
	$(dc) exec $(db) bash

node_bash:
	$(dc) exec $(node) bash

restart:
	$(dc) restart
