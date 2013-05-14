# These are good warnings to turn on by default
if GCC
AM_CXXFLAGS = -Wall \
              -Wwrite-strings \
              -Woverloaded-virtual \
              -Wno-sign-compare \
              -DS2_USE_EXACTFLOAT \
	      -DHASH_NAMESPACE=std
endif

AM_CPPFLAGS = -Wno-deprecated 

COMPILER_FLAGS = $(AM_CXXFLAGS) \
                 $(GFLAGS_CFLAGS)

# Library
lib_LTLIBRARIES = libs2.la libs2cellid.la

GOOGLE_BASE_LIB_FILES = base/int128.cc \
                        base/logging.cc \
                        base/stringprintf.cc \
                        base/strtoint.cc

GOOGLE_STRINGS_LIB_FILES = strings/ascii_ctype.cc \
                           strings/split.cc \
                           strings/stringprintf.cc \
                           strings/strutil.cc

GOOGLE_UTIL_CODING_LIB_FILES = util/coding/coder.cc \
                               util/coding/varint.cc

GOOGLE_UTIL_HASH_LIB_FILES = util/hash/hash.cc

GOOGLE_UTIL_MATH_LIB_FILES = util/math/mathutil.cc \
                             util/math/mathlimits.cc \
                             util/math/exactfloat/exactfloat.cc

libs2_la_CXXFLAGS = $(COMPILER_FLAGS)
libs2_la_LDFLAGS = $(CRYPTO_LIBS) -lgflags
libs2_la_SOURCES = $(GOOGLE_BASE_LIB_FILES) \
                   $(GOOGLE_STRINGS_LIB_FILES) \
                   $(GOOGLE_UTIL_CODING_LIB_FILES) \
		   $(GOOGLE_UTIL_HASH_LIB_FILES) \
                   $(GOOGLE_UTIL_MATH_LIB_FILES) \
                   s1interval.cc \
                   s2cap.cc \
                   s2cell.cc \
                   s2cellunion.cc \
                   s2edgeindex.cc \
                   s2edgeutil.cc \
                   s2latlngrect.cc \
                   s2loop.cc \
                   s2pointregion.cc \
                   s2polygon.cc \
                   s2polygonbuilder.cc \
                   s2polyline.cc \
                   s2r2rect.cc \
                   s2region.cc \
                   s2regioncoverer.cc \
                   s2regionintersection.cc \
                   s2regionunion.cc

libs2cellid_la_CXXFLAGS = $(COMPILER_FLAGS)
libs2cellid_la_LDFLAGS = $(CRYPTO_LIBS) -lgflags
libs2cellid_la_SOURCES = $(GOOGLE_BASE_LIB_FILES) \
                         $(GOOGLE_STRINGS_LIB_FILES) \
                         $(GOOGLE_UTIL_CODING_LIB_FILES) \
			 $(GOOGLE_UTIL_HASH_LIB_FILES) \
                         $(GOOGLE_UTIL_MATH_LIB_FILES) \
                         s1angle.cc \
                         s2.cc \
                         s2cellid.cc \
                         s2latlng.cc

