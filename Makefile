# -*- makefile-gmake -*-

.PHONY: clean test snowballs
.DEFAULT_GOAL := all

VERSION ?= $(shell cat "$(CHIBI_LOCATION_PATH)/VERSION")

CHIBI_FFI ?= $(CHIBI) -q $(CHIBI_LOCATION_PATH)/tools/chibi-ffi

CHIBI ?= LD_LIBRARY_PATH="$(CHIBI_LOCATION_PATH):$(LD_LIBRARY_PATH)" DYLD_LIBRARY_PATH="$(CHIBI_LOCATION_PATH):$(DYLD_LIBRARY_PATH)" CHIBI_IGNORE_SYSTEM_PATH=1 CHIBI_MODULE_PATH="$(CHIBI_LOCATION_PATH)/lib" $(CHIBI_LOCATION_PATH)/chibi-scheme$(EXE)

SDBI_COMPILED_LIBS = lib/sdbi/connector/ffi/sqlite3/sqlite3$(SO)

COMPILED_LIBS = $(SDBI_COMPILED_LIBS)

#META_FILES = lib/.sdbi.meta

########################################################################

include Makefile.libs

########################################################################

all: $(COMPILED_LIBS) # $(META_FILES)

#lib/.%.meta: lib/sdbi/connector/ffi/sqlite3.sld
#	-$(FIND) $< -name \*.sld | \
#	 $(CHIBI) $(CHIBI_LOCATION_PATH)/tools/generate-install-meta.scm $(VERSION) > $@

########################################################################
# Tests

test:

########################################################################
# Packaging

clean: clean-libs
	-$(RM) # $(META_FILES)
