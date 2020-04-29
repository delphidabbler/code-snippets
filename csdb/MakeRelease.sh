#!/bin/bash

# --------------------------------------------------------------------------
#
# Build tool for Windows to package up files ready for release.
#
# Two packages are made, each in a zip file: one containing the collection and
# the other containing documentation. Both zip files are written to the
# _release sub-folder in the collection's home directory.
#
# Any pre-existing _release sub-folder is deleted before the zip files are
# created.
#
# Requirements:
#
#   - The release version number must be passed to this script as a command
#     line.
#
#   - The zip utility is required to zip up the files.
#
# --------------------------------------------------------------------------


VERSION=$1
RELEASE_DIR="./_release"
RELEASE_FILE_PREFIX="csdb-v"
COLLECTION_ZIP_FILE="${RELEASE_DIR}/${RELEASE_FILE_PREFIX}${VERSION}.zip"
DOCS_ZIP_FILE="${RELEASE_DIR}/${RELEASE_FILE_PREFIX}${VERSION}-docs.zip"

echo Creating CSDB release $1
echo

rm -rf $RELEASE_DIR || true
mkdir $RELEASE_DIR

echo Zipping collection
zip -j -q $COLLECTION_ZIP_FILE ./collection/*

echo Zipping documentation
zip -j -q $DOCS_ZIP_FILE ./docs/*

echo Done
