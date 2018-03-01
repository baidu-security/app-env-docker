name=openrasp/php:5.6

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)

