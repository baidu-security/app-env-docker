name=openrasp/centos6

default: build run

build:
	docker build -t $(name) .
	rm -rf control

run: build
	docker run --cap-add=SYS_PTRACE --rm -v /tmp:/tmp -i -t $(name)
