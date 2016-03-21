project(s2 CXX)
set(PROJECT_NAME s2)
cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
add_definitions(-DS2_USE_EXACTFLOAT -DHASH_NAMESPACE=std)
set_property(GLOBAL PROPERTY CXX_STANDARD 11)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)

find_package(OpenSSL REQUIRED)

include_directories(
	s2
	.
	${OPENSSL_INCLUDE_DIR}
)

set(s2util_files
	base/int128.cc
	base/logging.cc
	base/stringprintf.cc
	base/strtoint.cc
	strings/ascii_ctype.cc
	strings/split.cc
	strings/stringprintf.cc
	strings/strutil.cc
	util/coding/coder.cc
	util/coding/varint.cc
	util/hash/hash.cc
	util/math/exactfloat/exactfloat.cc
	util/math/mathlimits.cc
	util/math/mathutil.cc
)

set(s2cellid_files
	s1angle.cc
	s2.cc
	s2cellid.cc
	s2latlng.cc
)

set(s2_files
	s1interval.cc
	s2cap.cc
	s2cell.cc
	s2cellunion.cc
	s2edgeindex.cc
	s2edgeutil.cc
	s2latlngrect.cc
	s2loop.cc
	s2pointregion.cc
	s2polygon.cc
	s2polygonbuilder.cc
	s2polyline.cc
	s2r2rect.cc
	s2region.cc
	s2regioncoverer.cc
	s2regionintersection.cc
	s2regionunion.cc
)

add_library(s2util SHARED ${s2util_files})
target_link_libraries(s2util ${OPENSSL_LIBRARIES})

add_library(s2cellid SHARED ${s2cellid_files})
target_link_libraries(s2cellid s2util)

add_library(s2 SHARED ${s2_files})
target_link_libraries(s2 s2cellid s2util ${OPENSSL_LIBRARIES} pthread)

install(TARGETS s2util s2cellid s2
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)


