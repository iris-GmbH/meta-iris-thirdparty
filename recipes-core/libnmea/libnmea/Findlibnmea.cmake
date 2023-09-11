# SPDX-License-Identifier: BSD-3-Clause
# Copyright (C) 2022 iris-GmbH infrared & intelligent sensors
# This file is based on work which is:
# Copyright 2000-2022 Kitware, Inc. and Contributors

# Look for the necessary header
find_path(libnmea_INCLUDE_DIR NAMES nmea.h)
mark_as_advanced(libnmea_INCLUDE_DIR)

# Look for the necessary library
find_library(libnmea_LIBRARY NAMES nmea)
mark_as_advanced(libnmea_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libnmea
    REQUIRED_VARS libnmea_INCLUDE_DIR libnmea_LIBRARY
    VERSION_VAR libnmea_VERSION)

# Create the imported target
if(libnmea_FOUND)
    set(libnmea_INCLUDE_DIRS ${libnmea_INCLUDE_DIR})
    set(libnmea_LIBRARIES ${libnmea_LIBRARY})
    if(NOT TARGET libnmea::libnmea)
        add_library(libnmea::libnmea UNKNOWN IMPORTED)
        set_target_properties(libnmea::libnmea PROPERTIES
            IMPORTED_LOCATION               "${libnmea_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${libnmea_INCLUDE_DIR}")
    endif()
endif()
