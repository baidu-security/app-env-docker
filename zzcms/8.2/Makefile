# name=openrasp/zzcms:8.2
name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')

default:
	docker build -t $(name) .

run:
	docker run --rm -it $(name)
