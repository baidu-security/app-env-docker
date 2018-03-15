SUBDIRS := $(wildcard */.)

default: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: default $(SUBDIRS)

compile_java:
	make -C java6 compile

compile_php:
	for dir in $(wildcard php*/.); do \
        $(MAKE) -C $$dir compile; \
    done	

compile: compile_java compile_php
