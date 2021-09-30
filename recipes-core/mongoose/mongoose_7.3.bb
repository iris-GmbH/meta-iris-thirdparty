# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

require recipes-core/mongoose/mongoose.inc

SRCREV = "32406b678b43de139403e6ad68de26a50d38a1c1"
LIC_FILES_CHKSUM = "file://LICENSE;md5=530df01565982e978c1e24a2ee516eeb"

EXTRA_OEMAKE += "'SOVERSION=7.3'" 

DEFAULT_PREFERENCE = "-1"
