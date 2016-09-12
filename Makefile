SHELL:=/bin/bash

build:
	docker-compose -f docker-compose.dev.yml up --build

run:
	docker-compose -f docker-compose.dev.yml up

shell:
	docker-compose -f docker-compose.dev.yml exec web /bin/sh
	sudo chown -R $(shell whoami):$(shell whoami) ./

shell-db:
	docker-compose -f docker-compose.dev.yml exec db psql --user=postgres


test:
	@clear
	docker-compose -f docker-compose.dev.yml exec web /bin/sh -c 'HANAMI_ENV=test bundle exec rspec'

test-no-tty:
	@clear
	@docker-compose -f docker-compose.dev.yml exec web /bin/sh -c 'HANAMI_ENV=test bundle exec rspec'
