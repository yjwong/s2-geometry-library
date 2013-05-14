#! /bin/sh -e

rm -rf autom4te.cache

aclocal --force -I m4
libtoolize --copy
autoconf --force
autoheader --force
automake --copy --add-missing

rm -rf autom4te.cache

