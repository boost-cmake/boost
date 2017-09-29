define_property(TARGET PROPERTY "INTERFACE_FIND_PACKAGE_NAME"
    BRIEF_DOCS "The package name that was searched for to create this target"
    FULL_DOCS "The package name that was searched for to create this target"
)

define_property(TARGET PROPERTY "INTERFACE_FIND_PACKAGE_REQUIRED"
    BRIEF_DOCS "true if REQUIRED option was given"
    FULL_DOCS "true if REQUIRED option was given"
)

define_property(TARGET PROPERTY "INTERFACE_FIND_PACKAGE_QUIETLY"
    BRIEF_DOCS "true if QUIET option was given"
    FULL_DOCS "true if QUIET option was given"
)

define_property(TARGET PROPERTY "INTERFACE_FIND_PACKAGE_EXACT"
    BRIEF_DOCS "true if EXACT option was given"
    FULL_DOCS "true if EXACT option was given"
)

define_property(TARGET PROPERTY "INTERFACE_FIND_PACKAGE_VERSION"
    BRIEF_DOCS "full requested version string"
    FULL_DOCS "full requested version string"
)

# Custom property to check if target exists
define_property(TARGET PROPERTY "INTERFACE_TARGET_EXISTS"
    BRIEF_DOCS "True if target exists"
    FULL_DOCS "True if target exists"
)
# Create shadow target to notify that the target exists
macro(bcm_shadow_notify TARGET)
    if(NOT TARGET _bcm_shadow_target_${TARGET})
        add_library(_bcm_shadow_target_${TARGET} INTERFACE IMPORTED GLOBAL)
    endif()
    set_target_properties(_bcm_shadow_target_${TARGET} PROPERTIES INTERFACE_TARGET_EXISTS 1)
endmacro()
# Check if target exists by querying the shadow target
macro(bcm_shadow_exists OUT TARGET)
    if("${TARGET}" MATCHES "^[_a-zA-Z0-9:]+$")
        if(NOT TARGET _bcm_shadow_target_${TARGET})
            add_library(_bcm_shadow_target_${TARGET} INTERFACE IMPORTED GLOBAL)
            set_target_properties(_bcm_shadow_target_${TARGET} PROPERTIES INTERFACE_TARGET_EXISTS 0)
        endif()
        set(${OUT} "$<TARGET_PROPERTY:_bcm_shadow_target_${TARGET},INTERFACE_TARGET_EXISTS>")
    else()
        set(${OUT} "0")
    endif()
endmacro()

# Add library extension to track imported targets
if(NOT COMMAND bcm_add_library_ext)
    macro(bcm_add_library_ext LIB)
        set(ARG_LIST "${ARGN}")
        if("IMPORTED" IN_LIST ARG_LIST)
            if(CMAKE_FIND_PACKAGE_NAME)
                set_target_properties(${LIB} PROPERTIES INTERFACE_FIND_PACKAGE_NAME ${CMAKE_FIND_PACKAGE_NAME})
                foreach(TYPE REQUIRED QUIETLY EXACT VERSION)
                    if(${CMAKE_FIND_PACKAGE_NAME}_FIND_${TYPE})
                        set_target_properties(${LIB} PROPERTIES INTERFACE_FIND_PACKAGE_${TYPE} ${${CMAKE_FIND_PACKAGE_NAME}_FIND_${TYPE}})
                    endif()
                endforeach()
            endif()
        endif()
    endmacro()

    macro(add_library)
        _add_library(${ARGN})
        bcm_add_library_ext(${ARGN})
    endmacro()

endif()
