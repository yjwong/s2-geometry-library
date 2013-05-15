## Process this file with automake to produce Makefile.in

# Make sure that when we re-make ./configure, we get the macros we need
ACLOCAL_AMFLAGS = -I m4
SUBDIRS = geometry

# Build Python components only if requested
if ENABLE_PYTHON_BUILD
SUBDIRS += geometry/python
endif

EXTRA_DIST = autogen.sh

