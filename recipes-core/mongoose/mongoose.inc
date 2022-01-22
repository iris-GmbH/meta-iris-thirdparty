# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

SUMMARY = "Embedded Web Server / Embedded Networking Library"

DESCRIPTION = "Mongoose is a networking library for C/C++. It implements event-driven non-blocking APIs for TCP, UDP, HTTP, WebSocket, MQTT."

HOMEPAGE = "https://www.cesanta.com/"

LICENSE = "GPLv2 | mongoose"
LICENSE_FLAGS = "commercial"

SECTION = "libs"

SRC_URI = "git://github.com/cesanta/mongoose.git;protocol=https;branch=master"

S = "${WORKDIR}/git"

DEPENDS += "openssl"

CFLAGS:prepend = "-Wno-format-truncation -fPIC "
EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'CFLAGS=${CFLAGS}' 'SSL=OPENSSL' 'DESTDIR=${D}' 'PREFIX=/usr'"

do_compile(){
    oe_runmake linux-libs
}

do_install(){
    mkdir -p ${D}${libdir}
    mkdir -p ${D}${includedir}
    oe_runmake install
}

BBCLASSEXTEND =+ "native nativesdk"
