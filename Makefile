SHELL:=/bin/bash

build:
	docker build -t bookshelf .

run:
	docker run -it --rm -p 3000:2300 -v $(shell pwd):/usr/src bookshelf

shell:
	docker run -it --rm -p 3000:2300 -v $(shell pwd):/usr/src bookshelf /bin/sh

test:
	clear
	docker run -it --rm -p 3000:2300 -v $(shell pwd):/usr/src bookshelf /bin/sh -c 'bundle exec rspec'
