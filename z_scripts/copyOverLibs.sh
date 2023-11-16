#!/bin/bash

case $1 in
  W)
    export BASE_DIR=/mnt/c/Users/dave
    export TEMP_DIR=${BASE_DIR}/temp/src-backup
    export ARDUINO_DIR=$BASE_DIR/Documents/Arduino/tcLibraryDev/lib
    export TCCLIBS_SOURCE_DIR=$BASE_DIR/source/tccLibs
    ;;
  M)
    export BASE_DIR=/Users/dave
    export TEMP_DIR=${BASE_DIR}/temp/src-backup
    export ARDUINO_DIR=$BASE_DIR/CLionProjects/tcLibraryDev/lib
    export TCCLIBS_SOURCE_DIR=$BASE_DIR/source/tccLibs
    ;;
  *)
    echo "Param 1: W=Windows, M=Mac"
    exit -1
    ;;
esac

copyOverLibrary()
{
  LIB_NAME=$1
  LIB_DIR="${ARDUINO_DIR}/${LIB_NAME}"

  echo "Copy over ${LIB_NAME} changes"
  zip --quiet -r ${TEMP_DIR}/${LIB_NAME}.zip  ${LIB_DIR}/src/*
  rm -rf ${LIB_DIR}/src
  cp -r ${TCCLIBS_SOURCE_DIR}/${LIB_NAME}/src ${LIB_DIR}/src
  if [ -d "${LIB_DIR}/tests" ]; then
    echo "  -- copy test packages"
    zip --quiet -r ${TEMP_DIR}/${LIB_NAME}_test.zip  ${LIB_DIR}/tests/*
    rm -rf ${LIB_DIR}/tests
    cp -r ${TCCLIBS_SOURCE_DIR}/${LIB_NAME}/tests ${LIB_DIR}/tests
  fi
}

mkdir -p ${TEMP_DIR}

echo "Source=${TCCLIBS_SOURCE_DIR}, dest=${ARDUINO_DIR}"
echo "Backups are in ${TEMP_DIR}"

#remove and redeploy each library
copyOverLibrary 'IoAbstraction'
copyOverLibrary 'tcMenu'
copyOverLibrary 'TaskManagerIO'
copyOverLibrary 'SimpleCollections'
copyOverLibrary 'LiquidCrystalIO'
copyOverLibrary 'tcUnicodeHelper'

echo "Lib copying done"
