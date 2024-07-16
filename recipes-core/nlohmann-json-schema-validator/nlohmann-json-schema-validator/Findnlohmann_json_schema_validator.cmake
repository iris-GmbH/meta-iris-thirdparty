# SPDX-License-Identifier: MIT
# Copyright (C) 2024

# Look for the necessary header
find_path(nlohmann_json_schema_validator_INCLUDE_DIR NAMES nlohmann/json-schema.hpp)
mark_as_advanced(nlohmann_json_schema_validator_INCLUDE_DIR)

# Look for the necessary library
find_library(nlohmann_json_schema_validator_LIBRARY NAMES nlohmann_json_schema_validator)
mark_as_advanced(nlohmann_json_schema_validator_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(json-schema-validator
    REQUIRED_VARS nlohmann_json_schema_validator_INCLUDE_DIR nlohmann_json_schema_validator_LIBRARY
    VERSION_VAR nlohmann_json_schema_validator_VERSION)

# Create the imported target
if(nlohmann_json_schema_validator_FOUND)
    set(nlohmann_json_schema_validator_INCLUDE_DIRS ${nlohmann_json_schema_validator_INCLUDE_DIR})
    set(nlohmann_json_schema_validator_LIBRARIES ${nlohmann_json_schema_validator_LIBRARY})
    if(NOT TARGET json-schema-validator::json-schema-validator)
        add_library(json-schema-validator::json-schema-validator UNKNOWN IMPORTED)
        set_target_properties(json-schema-validator::json-schema-validator PROPERTIES
            IMPORTED_LOCATION               "${nlohmann_json_schema_validator_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES   "${nlohmann_json_schema_validator_INCLUDE_DIR}")
    endif()
endif()