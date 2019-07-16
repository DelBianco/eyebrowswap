# Load .env file if it exists
include .env

CURRENT_DIRECTORY := $(shell pwd)

help:
	@echo "Docker Compose Help"
	@echo "-----------------------"

start:
	@docker-compose up -d

stop:
	@docker-compose stop

restart: stop up

build:
	@docker-compose up -d --build

tail:
	@docker-compose logs -f

php:
	@docker-compose exec app bash

mysql:
	@docker-compose exec db bash

test:
	docker exec -ti docker-api-workers-php-fpm ./vendor/phpunit/phpunit/phpunit tests

test-coverage:
	docker exec -ti docker-ctf-workers-php-fpm ./vendor/bin/phpunit --coverage-text

.PHONY: up stop restart build tail php redis test test-coverage