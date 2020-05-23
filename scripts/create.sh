#!/bin/bash
set -Ceu

if [ $# != 1 ]; then
	echo Invalid argument: $*
	exit 1
fi

SRC_DIR=src
TEMPLATE_DIR=__template__
TS_FILE_EXT=ts
TS_TEST_FILE_EXT=test.ts
TEMPLATE_TS_FILE=${TEMPLATE_DIR}/main.txt
TEMPLATE_TS_TEST_FILE=${TEMPLATE_DIR}/main.test.txt
REPLACE_TARGET=MODULE_NAME

NAME=$1
ERR=0

echo Start to create ${NAME} module

TS_FILE=${SRC_DIR}/${NAME}.${TS_FILE_EXT}
TS_TEST_FILE=${SRC_DIR}/${NAME}.${TS_TEST_FILE_EXT}

if [ -e ${TS_FILE} ]; then
  echo - File exists: ${TS_FILE}
  ERR=1
fi

if [ -e ${TS_TEST_FILE} ]; then
  echo - File exists: ${TS_TEST_FILE}
  ERR=1
fi

if [ ${ERR} != 0 ]; then
  echo "Do not anything."
  exit 1
fi

cp ${TEMPLATE_TS_FILE} ${TS_FILE}
echo Created: ${TS_FILE}
cp ${TEMPLATE_TS_TEST_FILE} ${TS_TEST_FILE}
sed -i "" -e "1 s/${REPLACE_TARGET}/${NAME}/g" ${TS_TEST_FILE}
echo Created: ${TS_TEST_FILE}

echo Finished.

exit 0