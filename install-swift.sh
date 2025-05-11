#!/bin/bash
set -e
set -eo pipefail

TEMP_PATH=./temp
INSTALL_PATH=$TEMP_PATH/framework

cp -r $INSTALL_PATH .