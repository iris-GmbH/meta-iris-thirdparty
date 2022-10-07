# SPDX-License-Identifier: BSD-3-Clause
# Copyright (C) 2022 iris-GmbH infrared & intelligent sensors
# This file is based on work which is:
# Copyright 2000-2022 Kitware, Inc. and Contributors

#[=======================================================================[.rst:
Findmongoose
------------

Finds the mongoose library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``mongoose::mongoose``

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``mongoose_FOUND``
  True if the system has the mongoose library.
``mongoose_VERSION``
  The version of the mongoose library which was found.
``mongoose_INCLUDE_DIRS``
  Include directories needed to use mongoose.
``mongoose_LIBRARIES``
  Libraries needed to link to mongoose.

#]=======================================================================]

# Look for the necessary header
find_path(mongoose_INCLUDE_DIR NAMES mongoose.h)
mark_as_advanced(mongoose_INCLUDE_DIR)

# Look for the necessary library
find_library(mongoose_LIBRARY NAMES mongoose)
mark_as_advanced(mongoose_LIBRARY)

# Extract version information from the header file
if(mongoose_INCLUDE_DIR)
    file(STRINGS ${mongoose_INCLUDE_DIR}/mongoose.h _ver_line
        REGEX "^#define[ \\t]+MG_VERSION[ \\t]+\"[0-9]+\\.[0-9]+\""
        LIMIT_COUNT 1)
    string(REGEX MATCH "[0-9]+\\.[0-9]+"
            mongoose_VERSION "${_ver_line}")
    unset(_ver_line)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(mongoose
    REQUIRED_VARS mongoose_INCLUDE_DIR mongoose_LIBRARY
    VERSION_VAR mongoose_VERSION)

# Create the imported target
if(mongoose_FOUND)
    set(mongoose_INCLUDE_DIRS ${mongoose_INCLUDE_DIR})
    set(mongoose_LIBRARIES ${mongoose_LIBRARY})
    if(NOT TARGET mongoose::mongoose)
        add_library(mongoose::mongoose UNKNOWN IMPORTED)
        set_target_properties(mongoose::mongoose PROPERTIES
            IMPORTED_LOCATION               "${mongoose_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${mongoose_INCLUDE_DIR}")
    endif()
endif()
