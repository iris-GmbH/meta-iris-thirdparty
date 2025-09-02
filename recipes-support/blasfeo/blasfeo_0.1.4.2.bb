SUMMARY = "Basic Linear Algebra Subroutines for Embedded Optimization"
DESCRIPTION = "BLASFEO is a dense linear algebra library providing high-performance \
implementations of BLAS- and LAPACK-like routines for use in embedded optimization. \
A key difference with respect to existing high-performance implementations of BLAS \
is that the computational performance is optimized for small to medium scale matrices."
HOMEPAGE = "https://github.com/giaf/blasfeo"
BUGTRACKER = "https://github.com/giaf/blasfeo/issues"
SECTION = "libs"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32c816687e9a08fdeccc68f14604f6a8"

SRC_URI = "\
    git://github.com/giaf/blasfeo.git;protocol=https;branch=master \
    file://0001-CMakeLists.txt-Fix-hardcoded-export-location.patch \
    file://0002-CMakeLists.txt-versioned-.so-lib.patch \
    file://0003-updated-version.txt.patch \
"

SRCREV = "3f4befd2abf157342a3e0759b6e9f49d56ceb998"

S = "${WORKDIR}/git"

inherit cmake

# Target architecture mapping for BLASFEO
TARGET_BLASFEO = "GENERIC"
TARGET_BLASFEO:armv7a = "ARMV7A_ARM_CORTEX_A7"
TARGET_BLASFEO:aarch64 = "ARMV8A_ARM_CORTEX_A53"

# CMake configuration
EXTRA_OECMAKE = "-DTARGET=${TARGET_BLASFEO} \
                 -DLA=HIGH_PERFORMANCE \
                 -DMACRO_LEVEL=0 \
                 -DBLAS_API=ON \
                 -DFORTRAN_BLAS_API=OFF \
                 -DBUILD_SHARED_LIBS=ON \
                 -DCMAKE_INSTALL_PREFIX=${prefix} \
                 -DCMAKE_INSTALL_LIBDIR=${baselib}"

# Package configuration options
PACKAGECONFIG ??= ""
PACKAGECONFIG[reference] = "-DLA=REFERENCE,,"
PACKAGECONFIG[blas-wrapper] = "-DLA=BLAS_WRAPPER,,"
PACKAGECONFIG[macro-level-1] = "-DMACRO_LEVEL=1,,"
PACKAGECONFIG[macro-level-2] = "-DMACRO_LEVEL=2,,"
PACKAGECONFIG[no-blas-api] = "-DBLAS_API=OFF,,"
PACKAGECONFIG[fortran-blas-api] = "-DFORTRAN_BLAS_API=ON,,"
PACKAGECONFIG[static-libs] = "-DBUILD_SHARED_LIBS=OFF,,"

# Package architecture specific due to optimized assembly
PACKAGE_ARCH = "${MACHINE_ARCH}"

BBCLASSEXTEND = "native nativesdk"
