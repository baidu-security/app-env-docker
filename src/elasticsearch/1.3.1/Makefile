name=openrasp/elasticsearch:1.3.1

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)

