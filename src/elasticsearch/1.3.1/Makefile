name=openrasp/jboss:4.0

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)

