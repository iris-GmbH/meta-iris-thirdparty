# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

SUMMARY = " QR decoder library"
DESCRIPTION = "QR codes are a type of high-density matrix barcodes, \
 and quirc is a library for extracting and decoding them from images."
HOMEPAGE= "https://github.com/dlbeer/quirc"
SECTION = "libs"

LICENSE = "ISC"
LIC_FILES_CHKSUM = "file://LICENSE;md5=9089f3b6d4a4b43f012b77e2c59320ee"

SRC_URI = "git://github.com/dlbeer/quirc.git;protocol=https;branch=master"
SRCREV = "2e8c4ce7bc45fbe137e50e338c297e265777e7dd"

SRC_URI += "file://0001-Set-Makefiles-LIB_VERSION-to-1.1.patch"
SRC_URI += "file://FindQuirc.cmake"

S = "${WORKDIR}/git"

DEPENDS = "libsdl libsdl-gfx libjpeg-turbo libpng"

PACKAGES =+ "${PN}-scanner ${PN}-demo"
FILES:${PN}-scanner = "${bindir}/${PN}-scanner"
FILES:${PN}-demo = "${bindir}/${PN}-demo"

inherit pkgconfig

CFLAGS:prepend = "-fPIC "
EXTRA_OEMAKE = "'PREFIX=/usr/'"

do_compile () {
    oe_runmake
}

do_install () {
    install -d ${D}${includedir}
    install -d ${D}${libdir}
    install -d ${D}${bindir}
    oe_runmake install DESTDIR=${D}
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/FindQuirc.cmake ${D}${datadir}/cmake/Modules
}

BBCLASSEXTEND =+ "native nativesdk"
