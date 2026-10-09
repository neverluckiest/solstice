# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/workspaces/solstice/build/_deps/cryptopp-cmake-build/cryptopp"
  "/workspaces/solstice/build/_deps/cryptopp-build"
  "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix"
  "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/tmp"
  "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/src/cryptopp-populate-stamp"
  "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/src"
  "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/src/cryptopp-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/src/cryptopp-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/solstice/build/_deps/cryptopp-subbuild/cryptopp-populate-prefix/src/cryptopp-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
