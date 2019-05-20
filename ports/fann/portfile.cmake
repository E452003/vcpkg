include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO E452003/fann
    REF 92340ee8f45daab8759f352a67f56c25246b7660
    SHA512 1c6544bdc5870b5b5b16aca8f3da387b50b28eba2b8b37c46420702b2c2ccaded3c8516c024f9820e5f05c44c45fa010df1362879142a5f62c37cfda9c210e4c
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
