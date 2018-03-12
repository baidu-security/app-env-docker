name=openrasp/centos6

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --rm -it $(name)
