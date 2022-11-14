# SPDX-License-Identifier: BSD-3-Clause
# Copyright (C) 2022 iris-GmbH infrared & intelligent sensors
# This file is based on work which is:
# Copyright 2000-2022 Kitware, Inc. and Contributors

#[=======================================================================[.rst:
Findquirc
------------

Finds the quirc library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``quirc::quirc``

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``quirc_FOUND``
  True if the system has the quirc library.
``quirc_INCLUDE_DIRS``
  Include directories needed to use quirc.
``quirc_LIBRARIES``
  Libraries needed to link to quirc.

#]=======================================================================]

# Look for the necessary header
find_path(quirc_INCLUDE_DIR NAMES quirc.h)
mark_as_advanced(quirc_INCLUDE_DIR)

# Look for the necessary library
find_library(quirc_LIBRARY NAMES quirc)
mark_as_advanced(quirc_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(quirc
    REQUIRED_VARS quirc_INCLUDE_DIR quirc_LIBRARY
    VERSION_VAR quirc_VERSION)

# Create the imported target
if(quirc_FOUND)
    set(quirc_INCLUDE_DIRS ${quirc_INCLUDE_DIR})
    set(quirc_LIBRARIES ${quirc_LIBRARY})
    if(NOT TARGET quirc::quirc)
        add_library(quirc::quirc UNKNOWN IMPORTED)
        set_target_properties(quirc::quirc PROPERTIES
            IMPORTED_LOCATION               "${quirc_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${quirc_INCLUDE_DIR}")
    endif()
endif()
