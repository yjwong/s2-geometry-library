m4_define([s2-geometry-library_major], [1])
m4_define([s2-geometry-library_minor], [0])
m4_define([s2-geometry-library_patch], [0])

AC_INIT([s2-geometry-library],
        [s2-geometry-library.major.s2-geometry-library.minor.s2-geometry-library.patch])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADER(config.h)

# The gflags are used for automake, not GCC!
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

# Required by Automake 1.12, but not recognised in older versions.
m4_pattern_allow([AM_PROG_AR])
AM_PROG_AR

# Adding libtool support
LT_INIT
AC_PROG_LIBTOOL

AX_CHECK_COMPILE_FLAG([-funsigned-char], [CXXFLAGS="$CXXFLAGS -funsigned-char"])
AX_CHECK_COMPILE_FLAG([-O3], [CXXFLAGS="$CXXFLAGS -O3"])
AX_CHECK_COMPILE_FLAG([-mmmx], [CXXFLAGS="$CXXFLAGS -mmmx"])
AX_CHECK_COMPILE_FLAG([-msse], [CXXFLAGS="$CXXFLAGS -msse"])
AX_CHECK_COMPILE_FLAG([-msse2], [CXXFLAGS="$CXXFLAGS -msse2"])

# Knobs for configuration.
AC_ARG_ENABLE([python],
              [AS_HELP_STRING([--enable-python],
                              [compile extensions for Python [default=no]])],
              [enable_python_build=$enableval], [enable_python_build=no])

# Checks for programs.
AC_LANG([C++])
AC_PROG_CXX
AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_CPP

# Let the Makefile know if we're gcc
AM_CONDITIONAL(GCC, test "$GCC" = yes)

# Check for libraries.
PKG_CHECK_MODULES(GFLAGS, libgflags)

# Check for header files.
AC_CHECK_HEADERS([gflags/gflags.h], [],
                 AC_MSG_ERROR([gflags library is required. See INSTALL file.]))

# Check to see if we need to build the Python modules
have_swig=no
AM_CONDITIONAL(ENABLE_PYTHON_BUILD, test "_$enable_python_build" = "_yes")
if test "_$enable_python_build" = "_yes"; then
    AM_PATH_PYTHON([3.3])
    AX_PYTHON_DEVEL([>= '3.3'])
    AX_PKG_SWIG([2.0.0], [have_swig=yes])
    if test "$have_swig" = "yes"; then
        AX_LIB_CRYPTO([yes])
        AX_SWIG_ENABLE_CXX
        AX_SWIG_PYTHON([yes])
    fi
fi

AC_CONFIG_FILES([Makefile geometry/Makefile geometry/python/Makefile])
AC_OUTPUT

