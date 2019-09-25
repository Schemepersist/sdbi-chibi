# -*- makefile-gmake -*-

.PHONY: clean test snowballs
.DEFAULT_GOAL := all

CHIBI_FFI ?= $(CHIBI) -q $(CHIBI_LOCATION_PATH)/tools/chibi-ffi

CHIBI ?= LD_LIBRARY_PATH="$(CHIBI_LOCATION_PATH):$(LD_LIBRARY_PATH)" DYLD_LIBRARY_PATH="$(CHIBI_LOCATION_PATH):$(DYLD_LIBRARY_PATH)" CHIBI_IGNORE_SYSTEM_PATH=1 CHIBI_MODULE_PATH="$(CHIBI_LOCATION_PATH)/lib" $(CHIBI_LOCATION_PATH)/chibi-scheme$(EXE)

SDBI_COMPILED_LIBS = lib/sdbi/connector/ffi/sqlite3/sqlite3$(SO)

COMPILED_LIBS = $(SDBI_COMPILED_LIBS)

########################################################################

include Makefile.libs

########################################################################

all: $(COMPILED_LIBS)

########################################################################
# Tests

test:

########################################################################
# Packaging

clean: clean-libs
#	-$(RM)
