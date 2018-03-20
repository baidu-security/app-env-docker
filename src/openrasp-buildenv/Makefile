SUBDIRS     := $(wildcard */.)
RELEASE_DIR := /tmp/openrasp-release
PLUGIN_URL  := https://raw.githubusercontent.com/baidu/openrasp/master/plugins/official/plugin.js

default: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: default $(SUBDIRS)

# 编译java版本
compile_java:
	rm -rf $(RELEASE_DIR)/java/
	make -C java6 compile

# 编译PHP 5.X版本
compile_php:
	rm -rf $(RELEASE_DIR)/php/

	for dir in $(wildcard php*/.); do \
        $(MAKE) -C $$dir compile; \
    done

	cp -R php-centos6-php5.3/package/* $(RELEASE_DIR)
	mkdir -p $(RELEASE_DIR)/{conf,plugins,assets,locale,logs}
	curl $(PLUGIN_URL) -o $(RELEASE_DIR)/plugins/official.js
	cd /tmp && tar cjpvf openrasp-release.tar.bz2 $(RELEASE_DIR)

# 编译全部
compile: compile_java compile_php
