SUBDIRS := $(wildcard */*/.)

default: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ build

.PHONY: default $(SUBDIRS)
