SUBDIRS     := $(wildcard */.)
RELEASE_DIR := /tmp/openrasp-release
PLUGIN_URL  := https://packages.baidu.com/app/openrasp/plugin.js

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

# 编译全部
compile: compile_java compile_php
