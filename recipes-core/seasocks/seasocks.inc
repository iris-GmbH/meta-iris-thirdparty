# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

DESCRIPTION = "A tiny embeddable C++ HTTP and WebSocket server for Linux"
HOMEPAGE = "https://github.com/mattgodbolt/seasocks"
SECTION = "libs"

LICENSE = "BSD-2-Clause & FPL"
LIC_FILES_CHKSUM = "file://LICENSE;md5=21362fe40271b97d3ce68f544471f159 \
                    file://src/main/c/sha1/license.txt;md5=5d75a650edc73a9ad20eb54329540b17"

SRC_URI = "git://github.com/mattgodbolt/seasocks.git;protocol=https;branch=master"

S = "${WORKDIR}/git"

DEPENDS = "zlib"

inherit cmake pkgconfig python3native

EXTRA_OECMAKE += "-DUNITTESTS=OFF \
                  -DCMAKE_BUILD_TYPE=RELEASE \
                  -DSEASOCKS_EXAMPLE_APP=OFF \
                  -DCMAKE_BUILD_TYPE=RELEASE"

# build as shared library
EXTRA_OECMAKE += "-DSEASOCKS_SHARED=TRUE"

# remove license from base-package installation process.
# yocto has it's own workflow for license inclusion
do_install:append() {
    rm -r ${D}${datadir}/licenses/Seasocks
    rmdir ${D}${datadir}/licenses 2>/dev/null || true
    rmdir ${D}${datadir} 2>/dev/null || true
}

BBCLASSEXTEND =+ "native nativesdk"
