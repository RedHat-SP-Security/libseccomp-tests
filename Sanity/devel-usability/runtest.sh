#!/bin/bash
set -e
set -x

TEST_SOURCE=test.c
TEST_TARGET="${TEST_SOURCE/\.c/}"

CXXFLAGS="$(rpm --eval '%{build_cxxflags}')"
LDFLAGS="$(rpm --eval '%{build_ldflags}') -Wl,--no-as-needed"
PKGFLAGS="$(pkg-config libseccomp --cflags --libs)"

# build target using distribution-specific flags
gcc -Werror $CXXFLAGS $LDFLAGS $PKGFLAGS -o $TEST_TARGET $TEST_SOURCE

# test that target exists
test -f ./$TEST_TARGET

# test that target is executable
test -x ./$TEST_TARGET

# test that target runs successfully
./$TEST_TARGET