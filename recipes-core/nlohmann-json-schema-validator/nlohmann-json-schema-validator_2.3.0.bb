# SPDX-License-Identifier: MIT
# Copyright (C) 2024

SUMMARY = "JSON Schema Validator for JSON for Modern C++"
DESCRIPTION = "A JSON schema validator built on top of the nlohmann JSON library for Modern C++."
HOMEPAGE = "https://github.com/pboettch/json-schema-validator/"
SECTION = "libs"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=61fd664db5e9509d6c58dbc3b7646b7f"

SRC_URI = "git://github.com/pboettch/json-schema-validator.git;protocol=https;branch=main"
SRC_URI += " \
    file://Findnlohmann_json_schema_validator.cmake \
"

SRCREV = "349cba9f7e3cb423bbc1811bdd9f6770f520b468"

FILES:${PN} += "\
                ${libdir}/json-schema-validator/* \
                "

S = "${WORKDIR}/git"

inherit cmake

EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON \
                  -DJSON_VALIDATOR_BUILD_TESTS=OFF \
                  -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF \
                  "

do_install:append() {
    install -d ${D}${datadir}/cmake/Modules
    install -m 644 ${WORKDIR}/Findnlohmann_json_schema_validator.cmake ${D}${datadir}/cmake/Modules
}
