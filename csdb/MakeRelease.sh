#!/bin/bash

# --------------------------------------------------------------------------
# DelphiDabbler Code Snippets Database v2
#
# Build tool for Windows to package up files ready for release.
#
# This file is licensed under the MIT license, copyright © 2020-2023 Peter
# Johnson, https://gravatar.com/delphidabbler
#
#
# Three packages are made, each in a zip file: one containing the
# collection, another containing documentation and a third containing tests.
# All zip files are written to the _release sub-folder in the collection's
# home directory.
#
# Any pre-existing _release sub-folder is cleared before the zip files are
# created.
#
# Requirements:
#
#   - The release version number must be passed to this script as a command
#     line parameter.
#
#   - The zip utility program is required to zip up the files.
#
# --------------------------------------------------------------------------


VERSION=$1
RELEASE_DIR="./_release"
RELEASE_FILE_STUB="${RELEASE_DIR}/csdb-v${VERSION}"

COLLECTION_ZIP_FILE="${RELEASE_FILE_STUB}-data.zip"
DOCS_ZIP_FILE="${RELEASE_FILE_STUB}-docs.zip"
TESTS_ZIP_FILE="${RELEASE_FILE_STUB}-tests.zip"

echo Creating CSDB release $1
echo

rm -rf $RELEASE_DIR || true
mkdir $RELEASE_DIR

echo Zipping data
zip -j -q $COLLECTION_ZIP_FILE ./collection/*

echo Zipping documentation
zip -j -q $DOCS_ZIP_FILE ./docs/*

echo Zipping tests
zip -q -r $TESTS_ZIP_FILE ./tests/*

echo Done
