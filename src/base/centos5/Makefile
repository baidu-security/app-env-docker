name=openrasp/centos5-64

default: build run

build:
	docker build -t $(name) .
	rm -rf control

run: build
	docker run --cap-add=SYS_PTRACE --rm -i -t $(name)
