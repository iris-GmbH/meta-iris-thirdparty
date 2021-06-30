# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

SUMMARY = "Embedded Web Server / Embedded Networking Library"

DESCRIPTION = "Mongoose is a networking library for C/C++. It implements event-driven non-blocking APIs for TCP, UDP, HTTP, WebSocket, MQTT."

HOMEPAGE = "https://www.cesanta.com/"

LICENSE = "GPLv2 | mongoose"
LICENSE_FLAGS = "commercial"
LIC_FILES_CHKSUM = "file://LICENSE;md5=530df01565982e978c1e24a2ee516eeb"

SECTION = "libs"

SRC_URI = "git://github.com/cesanta/mongoose.git"
SRCREV = "452bcc68a4c5fecce2ca6ad5c9b60beca9b0214f"

SRC_URI += "file://0001-Makefile-add-static-and-dynamic-lib-targets.patch"

S = "${WORKDIR}/git"

DEPENDS += "openssl"

CFLAGS_prepend = "-Wno-format-truncation -fPIC "
EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'CFLAGS=${CFLAGS}' 'SSL=OPENSSL' 'DESTDIR=${D}' 'PREFIX=/usr'"

do_compile(){
    oe_runmake linux-libs
}

do_install(){
    mkdir -p ${D}${libdir}
    mkdir -p ${D}${includedir}
    oe_runmake install
}
