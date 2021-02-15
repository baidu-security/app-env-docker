name=openrasp-buildenv/all-in-one

default: build run

build:
	docker build -t $(name) .

run: build
	docker run --cap-add=SYS_PTRACE --rm -i -t $(name)
