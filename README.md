# s2-geometry-library

* License: Apache 2.0 (see `geometry/LICENSE-2.0.txt`)
* Upstream: https://code.google.com/p/s2-geometry-library/
* With fixes from [yjwong](https://github.com/yjwong/s2-geometry-library).
* Presentation: https://docs.google.com/presentation/d/1Hl4KapfAENAOf4gv-pSngKwvS_jwNVHRPZTTDzXXn6Q/view?pli=1
* Documentation: none provided by upstream, read the presentation; other ports have better documentation

This package has Python bindings which target Python 2.7.  You can also use it
as a C++ library.

In Python code, `import s2`.

## Building the Debian package

```console
apt-get install python-dev debhelper libgflags-dev cdbs swig build-essential fakeroot autoconf libtool pkg-config
./autogen.sh
pushd ..
tar jcf s2_1.0.0.orig.tar.bz2 s2-geometry-library/ --exclude=.git
popd
dpkg-buildpackage -rfakeroot
```

## Installing the Debian package

Once built:

```console
dpkg -i ../libs2*.deb ../python-s2*.deb
```

## Running the tests (Python)

```console
python test.py
```

