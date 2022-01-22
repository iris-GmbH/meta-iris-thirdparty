# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

DESCRIPTION = "CAF is an open source implementation of the actor model for \ 
C++ featuring lightweight & fast actor implementations, pattern matching for \
messages, network transparent messaging, and more."
HOMEPAGE = "https://www.actor-framework.org/"
SECTION = "libs"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ee8f49240c963159b27ef65f9aa6bcb1"

SRC_URI = "git://github.com/actor-framework/actor-framework.git;protocol=https;branch=master"

DEPENDS = "curl openssl"

PACKAGES =+ "${PN}-openssl ${PN}-io ${PN}-tools"

FILES_${PN}-openssl += "${libdir}/libcaf_openssl.so.${PV}" 
FILES_${PN}-io += "${libdir}/libcaf_io.so.${PV}" 
FILES_${PN}-tools += "${datadir}/caf/tools/*" 

RDEPENDS_${PN}-openssl = "openssl"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELEASE \
                  -DCAF_ENABLE_EXAMPLES=OFF \
                  -DCAF_ENABLE_TESTING=OFF \
                  -DCMAKE_CXX_STANDARD=17"

BBCLASSEXTEND =+ "native nativesdk"
