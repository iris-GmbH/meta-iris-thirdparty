# SPDX-License-Identifier: MIT
# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors

require recipes-core/seasocks/seasocks.inc

SRCREV = "1aebad79d5f88a0a58c37189eacdc7d48d602349"

SRC_URI += "file://0001-Drop-obsolete-glibc-check-and-fix-musl-compilation.patch"
