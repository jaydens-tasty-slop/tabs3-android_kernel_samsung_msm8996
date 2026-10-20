#!/bin/bash
# Created by Deokgyu Yang <secugyu@gmail.com>

# Create a soft link file named ld for use lld to fix the build error on modern clang
# GCC uses the system linker and needs no Clang-specific alias.
case "${HOSTCC##*/}" in
    clang|clang-[0-9]*)
        CLANG_PATH="$(command -v "$HOSTCC")"
        CLANG_BIN="${CLANG_PATH%/*}"
        if [ ! -e "${CLANG_BIN}/ld" ]; then
            ln -s "${CLANG_BIN}/lld" "${CLANG_BIN}/ld"
        fi
        ;;
esac
