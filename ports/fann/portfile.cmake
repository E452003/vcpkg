include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO E452003/fann
    REF 9a9f09d3ef973533836cab72578049dd3b3616eb
    SHA512 ed29b8f71c774e1eaab9f888735f224752b655507ca197fb90058f5956231a409c9693a27cfff208ab91c362b9ccdff8cfd0e0bb655307be91c59861d2b68c4e
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()

if(NOT VCPKG_CMAKE_SYSTEM_NAME)
    # Remove useless config file and include path
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/cmake)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/pkgconfig)
endif()

# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(RENAME ${CURRENT_PACKAGES_DIR}/share/${PORT}/LICENSE.md ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright)

vcpkg_copy_pdbs()
