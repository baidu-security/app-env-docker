name=openrasp/ubuntu16

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --cap-add=SYS_PTRACE --rm -i -t $(name)

