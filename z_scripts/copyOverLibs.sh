#!/bin/bash

case $1 in
  W)
    export BASE_DIR=/mnt/c/Users/dave
    export ARDUINO_DIR=$BASE_DIR/Documents/Arduino/libraries
    export TCCLIBS_SOURCE_DIR=$BASE_DIR/source/tccLibs
    ;;
  M)
    export BASE_DIR=/Users/dave
    export ARDUINO_DIR=$BASE_DIR/Documents/Arduino/libraries
    export TCCLIBS_SOURCE_DIR=$BASE_DIR/source/tccLibs
    ;;
  *)
    echo "Param 1: W=Windows, M=Mac"
    ;;
esac

copyOverLibrary()
{
  echo "Deploy $${TCCLIBS_SOURCE_DIR}/${LIB_NAME}  to ${ARDUINO_DIR}/${LIB_NAME}, please check for changes in git repo."
  LIB_NAME=$1
  rm -rf ${ARDUINO_DIR}/libraries/${LIB_NAME}/src
  cp -r ${TCCLIBS_SOURCE_DIR}/${LIB_NAME}/src ${ARDUINO_DIR}/libraries/${LIB_NAME}/src
  if [ -d "${ARDUINO_DIR}/libraries/${LIB_NAME}/test" ]
  then
    echo "    -- copy test packages"
    rm -rf ${ARDUINO_DIR}/libraries/${LIB_NAME}/test
    cp -r ${TCCLIBS_SOURCE_DIR}/${LIB_NAME}/test ${ARDUINO_DIR}/libraries/${LIB_NAME}/test
  fi
}

#remove and then redeploy each library
copyOverLibrary('IoAbstraction')
copyOverLibrary('tcMenu')
copyOverLibrary('TaskManagerIO')
copyOverLibrary('SimpleCollections')
copyOverLibrary('LiquidCrystalIO')
copyOverLibrary('tcUnicodeHelper')

echo "Lib copying done"
