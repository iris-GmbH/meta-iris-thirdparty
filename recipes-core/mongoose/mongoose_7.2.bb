# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

require recipes-core/mongoose/mongoose.inc

SRCREV = "452bcc68a4c5fecce2ca6ad5c9b60beca9b0214f"
LIC_FILES_CHKSUM = "file://LICENSE;md5=530df01565982e978c1e24a2ee516eeb"

SRC_URI += "file://0001-Makefile-add-static-and-dynamic-lib-targets.patch"

DEFAULT_PREFERENCE = "-1"
