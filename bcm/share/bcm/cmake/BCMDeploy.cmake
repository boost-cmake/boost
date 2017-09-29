
include(BCMPkgConfig)
include(BCMInstallTargets)
include(BCMExport)

function(bcm_deploy)
    set(options)
    set(oneValueArgs NAMESPACE COMPATIBILITY)
    set(multiValueArgs TARGETS INCLUDE)

    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}" "${multiValueArgs}"  ${ARGN})

    bcm_install_targets(TARGETS ${PARSE_TARGETS} INCLUDE ${PARSE_INCLUDE})
    bcm_auto_pkgconfig(TARGET ${PARSE_TARGETS})
    bcm_auto_export(TARGETS ${PARSE_TARGETS} NAMESPACE ${PARSE_NAMESPACE} COMPATIBILITY ${PARSE_COMPATIBILITY})

    foreach(TARGET ${PARSE_TARGETS})
        get_target_property(TARGET_NAME ${TARGET} EXPORT_NAME)
        if(NOT TARGET_NAME)
            get_target_property(TARGET_NAME ${TARGET} NAME)
        endif()
        set(EXPORT_LIB_TARGET ${PARSE_NAMESPACE}${TARGET_NAME})
        if(NOT TARGET ${EXPORT_LIB_TARGET})
            add_library(${EXPORT_LIB_TARGET} ALIAS ${TARGET})
        endif()
        set_target_properties(${TARGET} PROPERTIES INTERFACE_FIND_PACKAGE_NAME ${PROJECT_NAME})
        bcm_shadow_notify(${EXPORT_LIB_TARGET})
        bcm_shadow_notify(${TARGET})
    endforeach()

endfunction()