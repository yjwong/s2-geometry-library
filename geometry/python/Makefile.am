BUILT_SOURCES = $(srcdir)/s2_wrap.cpp
SWIG_SOURCES = s2.swig

pkgpython_PYTHON = s2.py
pkgpyexec_LTLIBRARIES = _s2.la

_s2_la_SOURCES = $(srcdir)/s2_wrap.cpp $(SWIG_SOURCES)
_s2_la_CPPFLAGS = $(AX_SWIG_PYTHON_CPPFLAGS) -I$(top_srcdir)/geometry
_s2_la_LDFLAGS = -module
_s2_la_LIBADD = ../libs2.la ../libs2cellid.la

$(srcdir)/s2_wrap.cpp: $(SWIG_SOURCES)
	$(SWIG) $(AX_SWIG_PYTHON_OPT) -py3 -I$(top_srcdir)/geometry -o $@ $<

