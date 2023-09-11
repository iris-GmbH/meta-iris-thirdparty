# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent 

SUMMARY = "C Library for Parsing NMEA 0183 Sentences"
DESCRIPTION = "Nmea is a standard that is used for sending gps data \
               and libnmea is a library to parse nmea Sentences"
HOMEPAGE= "https://github.com/jacketizer/libnmea/"
SECTION = "libs"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=61fd664db5e9509d6c58dbc3b7646b7f"

SRC_URI = "git://github.com/jacketizer/libnmea.git;protocol=https;branch=master"
SRC_URI += " \
    file://Findlibnmea.cmake \
"

SRCREV = "91fd4338a8f648de9b174d7aac954fedce8852aa"

FILES:${PN} += "\
                ${libdir}/nmea/* \
                "

S = "${WORKDIR}/git"

inherit cmake

EXTRA_OECMAKE += "-DNMEA_BUILD_SHARED_LIB=ON \
                  -DNMEA_BUILD_STATIC_LIB=OFF \
                  -DNMEA_EXAMPLES_LINK_STATIC=OFF \
                  -DNMEA_BUILD_EXAMPLES=OFF \
                  -DNMEA_UNIT_TESTS=OFF \
                  -DNMEA_UNIT_TESTS_LINK_STATIC=OFF \
                  -DNMEA_WITH_MEMCHECK=OFF \
                  "

do_install:append() {
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/Findlibnmea.cmake ${D}${datadir}/cmake/Modules
}