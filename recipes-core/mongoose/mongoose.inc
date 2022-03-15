# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

SUMMARY = "Embedded Web Server / Embedded Networking Library"

DESCRIPTION = "Mongoose is a networking library for C/C++. It implements event-driven non-blocking APIs for TCP, UDP, HTTP, WebSocket, MQTT."

HOMEPAGE = "https://www.cesanta.com/"

LICENSE = "GPLv2 | mongoose"
LICENSE_FLAGS = "commercial"

SECTION = "libs"

SRC_URI = "git://github.com/cesanta/mongoose.git;protocol=https;branch=master"
SRC_URI += "file://FindMongoose.cmake"

S = "${WORKDIR}/git"

CFLAGS:prepend = "-Wno-format-truncation -fPIC "
EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'CFLAGS=${CFLAGS}' 'DESTDIR=${D}' 'PREFIX=/usr'"

FILES_SOLIBSDEV = ""
FILES:${PN} += "${libdir}/"
INSANE_SKIP:${PN} = "dev-so"

do_compile(){
    oe_runmake linux-libs
}

do_install(){
    mkdir -p ${D}${libdir}
    mkdir -p ${D}${includedir}
    oe_runmake install
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/FindMongoose.cmake ${D}${datadir}/cmake/Modules
}

BBCLASSEXTEND =+ "native nativesdk"
