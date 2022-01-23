# SPDX-License-Identifier: BSD-3-Clause
# Copyright (C) 2022 iris-GmbH infrared & intelligent sensors
# This file is based on work which is:
# Copyright 2000-2022 Kitware, Inc. and Contributors

#[=======================================================================[.rst:
FindQuirc
------------

Finds the Quirc library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Quirc::Quirc``

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``Quirc_FOUND``
  True if the system has the Quirc library.
``Quirc_INCLUDE_DIRS``
  Include directories needed to use Quirc.
``Quirc_LIBRARIES``
  Libraries needed to link to Quirc.

#]=======================================================================]

# Look for the necessary header
find_path(Quirc_INCLUDE_DIR NAMES quirc.h)
mark_as_advanced(Quirc_INCLUDE_DIR)

# Look for the necessary library
find_library(Quirc_LIBRARY NAMES quirc)
mark_as_advanced(Quirc_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Quirc
    REQUIRED_VARS Quirc_INCLUDE_DIR Quirc_LIBRARY
    VERSION_VAR Quirc_VERSION)

# Create the imported target
if(Quirc_FOUND)
    set(Quirc_INCLUDE_DIRS ${Quirc_INCLUDE_DIR})
    set(Quirc_LIBRARIES ${Quirc_LIBRARY})
    if(NOT TARGET Quirc::Quirc)
        add_library(Quirc::Quirc UNKNOWN IMPORTED)
        set_target_properties(Quirc::Quirc PROPERTIES
            IMPORTED_LOCATION               "${Quirc_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${Quirc_INCLUDE_DIR}")
    endif()
endif()
