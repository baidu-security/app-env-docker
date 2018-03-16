SUBDIRS := $(wildcard */.)

default: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: default $(SUBDIRS)

compile_java:
	make -C java6 compile

compile_php:
	rm -rf /tmp/openrasp-release

	for dir in $(wildcard php*/.); do \
        $(MAKE) -C $$dir compile; \
    done

	cp php-centos6-php5.3/package/* /tmp/openrasp-release
	cd /tmp && tar cjpvf openrasp-release.tar.bz2 openrasp-release

compile: compile_java compile_php
