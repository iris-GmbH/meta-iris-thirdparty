# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

SUMMARY = "Embedded Web Server / Embedded Networking Library"

DESCRIPTION = "Mongoose is a networking library for C/C++. It implements event-driven non-blocking APIs for TCP, UDP, HTTP, WebSocket, MQTT."

HOMEPAGE = "https://www.cesanta.com/"

LICENSE = "GPL-2.0-only | mongoose"
LICENSE_FLAGS = "commercial"

SECTION = "libs"

SRC_URI = "git://github.com/cesanta/mongoose.git;protocol=https;branch=master"
SRC_URI += " \
    file://Findmongoose.cmake \
"

S = "${WORKDIR}/git"

PACKAGECONFIG ??= "openssl"
PACKAGECONFIG[openssl] = "SSL='OPENSSL' OPENSSL='${STAGING_EXECPREFIXDIR}',,openssl"

CFLAGS:prepend = "-Wno-format-truncation -fPIC "
EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'OPTS=${CFLAGS}' 'DESTDIR=${D}' 'PREFIX=/usr' ${PACKAGECONFIG_CONFARGS}"

# Makefile was moved to test/Makefile with https://github.com/cesanta/mongoose/commit/89aaf1c30c20db939154121d4eb0320339b2f053
MAKEFILE_DIR="test"

do_compile(){
    cd ${MAKEFILE_DIR}
    oe_runmake linux-libs
}

do_install(){
    mkdir -p ${D}${libdir}
    mkdir -p ${D}${includedir}
    cd ${MAKEFILE_DIR}
    oe_runmake install
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/Findmongoose.cmake ${D}${datadir}/cmake/Modules
}

BBCLASSEXTEND =+ "native nativesdk"
