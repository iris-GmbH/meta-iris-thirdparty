# SPDX-License-Identifier: BSD-3-Clause
# Copyright (C) 2022 iris-GmbH infrared & intelligent sensors
# This file is based on work which is:
# Copyright 2000-2022 Kitware, Inc. and Contributors

#[=======================================================================[.rst:
FindMongoose
------------

Finds the Mongoose library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Mongoose::Mongoose``

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``Mongoose_FOUND``
  True if the system has the Mongoose library.
``Mongoose_VERSION``
  The version of the Mongoose library which was found.
``Mongoose_INCLUDE_DIRS``
  Include directories needed to use Mongoose.
``Mongoose_LIBRARIES``
  Libraries needed to link to Mongoose.

#]=======================================================================]

# Look for the necessary header
find_path(Mongoose_INCLUDE_DIR NAMES mongoose.h)
mark_as_advanced(Mongoose_INCLUDE_DIR)

# Look for the necessary library
find_library(Mongoose_LIBRARY NAMES mongoose)
mark_as_advanced(Mongoose_LIBRARY)

# Extract version information from the header file
if(Mongoose_INCLUDE_DIR)
    file(STRINGS ${Mongoose_INCLUDE_DIR}/mongoose.h _ver_line
        REGEX "^#define[ \\t]+MG_VERSION[ \\t]+\"[0-9]+\\.[0-9]+\""
        LIMIT_COUNT 1)
    string(REGEX MATCH "[0-9]+\\.[0-9]+"
            Mongoose_VERSION "${_ver_line}")
    unset(_ver_line)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Mongoose
    REQUIRED_VARS Mongoose_INCLUDE_DIR Mongoose_LIBRARY
    VERSION_VAR Mongoose_VERSION)

# Create the imported target
if(Mongoose_FOUND)
    set(Mongoose_INCLUDE_DIRS ${Mongoose_INCLUDE_DIR})
    set(Mongoose_LIBRARIES ${Mongoose_LIBRARY})
    if(NOT TARGET Mongoose::Mongoose)
        add_library(Mongoose::Mongoose UNKNOWN IMPORTED)
        set_target_properties(Mongoose::Mongoose PROPERTIES
            IMPORTED_LOCATION               "${Mongoose_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${Mongoose_INCLUDE_DIR}")
    endif()
endif()
