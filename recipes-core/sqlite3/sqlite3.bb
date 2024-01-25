# SPDX-License-Identifier: MIT
# Copyright (C) 2024 iris-GmbH infrared & intelligent sensors

SUMMARY = "SQLite3 Database Library"
DESCRIPTION = "SQLite3 is a C library that provides a lightweight disk-based database"
HOMEPAGE = "https://www.sqlite.org/"
SECTION = "libs"

LICENSE = "Public-Domain"
LIC_FILES_CHKSUM = "file://LICENSE;md5=[checksum- TODO]"

#SRC_URI = "git://github.com/jacketizer/libnmea.git;protocol=https;branch=master"

SRC_URI = "[sqlite3 source repository];protocol=https"
SRCREV = "[specific commit or tag]"
SRC_URI += " \
    file://Findsqlite.cmake \


S = "${WORKDIR}/[path to SQLite3 source]"

inherit cmake

EXTRA_OECMAKE += " \
                  -DSQLITE3_BUILD_SHARED_LIB=ON \
                  -DSQLITE3_BUILD_STATIC_LIB=OFF \
                  "

do_install:append() {
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/FindSQLite3.cmake ${D}${datadir}/cmake/Modules
}
