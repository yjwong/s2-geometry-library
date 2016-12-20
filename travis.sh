#!/bin/sh -x
# Continuous integration script for Travis

# Add flags for openssl on osx
if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"
fi

# Build the library and install it.
echo "## Building and installing libs2..."
cd geometry
cmake .
make -j3
sudo make install

if [ "${TRAVIS_OS_NAME}" = "linux" ]; then
	sudo ldconfig -v | grep libs2
fi

# Build and run the C++ tests
echo "## Building and running the C++ tests..."
cd tests
cmake .
make -j3
./tests || exit 1

if [ "${TRAVIS_OS_NAME}" = "linux" ]; then
	# We really want to use the system version of Python.  Travis'
	# has broken distutils paths, and assumes a virtualenv.
	PATH="/usr/bin:${PATH}"
	which python2.7
	python2.7 -V
fi

# Build and install the Python bindings
echo "## Building and installing the Python bindings..."
cd ../python
cmake .
make VERBOSE=1
sudo make install

# Run the Python tests
echo "## Running the Python tests..."
python2.7 -v -c 'import s2'
python2.7 test.py || exit 1

