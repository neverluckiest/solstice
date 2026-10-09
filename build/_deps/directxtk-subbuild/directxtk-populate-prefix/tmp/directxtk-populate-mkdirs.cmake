# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspaces/solstice/build/_deps/directxtk-src"
  "/workspaces/solstice/build/_deps/directxtk-build"
  "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix"
  "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/tmp"
  "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/src/directxtk-populate-stamp"
  "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/src"
  "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/src/directxtk-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/src/directxtk-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/solstice/build/_deps/directxtk-subbuild/directxtk-populate-prefix/src/directxtk-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
