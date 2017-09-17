abspath_to_makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(patsubst %/,%,$(dir $(abspath_to_makefile)))

.PHONY: all
all: install

libs := $(notdir $(wildcard $(makefile_dir)/*.sh))

install_libs := $(libs:%=install_%)

.PHONY: install
install: $(install_libs)

lib_dir := $(HOME)/lib

.PHONY: $(install_libs)
$(install_libs): | $(lib_dir)
	$(eval lib := $(@:install_%=%))
	cp -f $(makefile_dir)/$(lib) $(lib_dir)/$(lib)

$(lib_dir):
	mkdir -p $@

uninstall_libs := $(libs:%=uninstall_%)

.PHONY: uninstall
uninstall: $(uninstall_libs)

.PHONY: $(uninstall_libs)
$(uninstall_libs):
	$(eval lib := $(@:uninstall_%=%))
	rm -f $(lib_dir)/$(lib)
