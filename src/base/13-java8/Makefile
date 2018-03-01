name=openrasp/java:8

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)

