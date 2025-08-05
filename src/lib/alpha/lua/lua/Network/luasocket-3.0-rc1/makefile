# luasocket makefile
#
# see src/makefile for description of how to customize the build
#
# Targets:
#   install            install system independent support
#   install-unix           also install unix-only support
#   install-both       install for both lua5.1 and lua5.2 
#   install-both-unix      also install unix-only 
#   print	           print the build settings

PLAT?= linux
PLATS= macosx linux win32 mingw

all: $(PLAT)

$(PLATS) none install install-unix local clean:
	$(MAKE) -C src $@

print:
	$(MAKE) -C src $@

test:
	lua test/hello.lua

install-both:
	$(MAKE) clean 
	@cd src; $(MAKE) $(PLAT) LUAV=5.1
	@cd src; $(MAKE) install LUAV=5.1
	$(MAKE) clean 
	@cd src; $(MAKE) $(PLAT) LUAV=5.2
	@cd src; $(MAKE) install LUAV=5.2

install-both-unix:
	$(MAKE) clean 
	@cd src; $(MAKE) $(PLAT) LUAV=5.1
	@cd src; $(MAKE) install-unix LUAV=5.1
	$(MAKE) clean 
	@cd src; $(MAKE) $(PLAT) LUAV=5.2
	@cd src; $(MAKE) install-unix LUAV=5.2

.PHONY: test

