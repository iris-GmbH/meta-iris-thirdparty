# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

require recipes-core/seasocks/seasocks.inc

SRCREV = "7fd17dd1b33c76d622c9dd0eae2579d29bff8056"

SRC_URI += "file://0001-versioned-shared-library.patch"

DEFAULT_PREFERENCE = "-1"
