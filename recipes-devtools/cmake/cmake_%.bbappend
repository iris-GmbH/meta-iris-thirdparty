SRC_URI += "file://iristhirdparty-modules.cmake"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append:class-nativesdk() {
    # OEToolchainConfig.cmake will include everything in OEToolchainConfig.cmake.d/
    mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
    install -m 644 ${WORKDIR}/iristhirdparty-modules.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
}

