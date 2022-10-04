SRC_URI += "file://iristhirdparty-modules.cmake"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

do_install_append_class-nativesdk() {
    # OEToolchainConfig.cmake will include everything in OEToolchainConfig.cmake.d/
    mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
    install -m 644 ${WORKDIR}/iristhirdparty-modules.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
}

