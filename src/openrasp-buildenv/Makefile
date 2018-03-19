SUBDIRS     := $(wildcard */.)
RELEASE_DIR := /tmp/openrasp-release

default: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: default $(SUBDIRS)

# 编译java版本
compile_java:
	make -C java6 compile

# 编译PHP 5.X版本
compile_php:
	rm -rf $(RELEASE_DIR)

	for dir in $(wildcard php*/.); do \
        $(MAKE) -C $$dir compile; \
    done

	cp php-centos6-php5.3/package/* $(RELEASE_DIR)
	cd /tmp && tar cjpvf openrasp-release.tar.bz2 $(RELEASE_DIR)

# 编译全部
compile: compile_java compile_php
