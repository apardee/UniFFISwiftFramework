#!/bin/bash

TEMP_PATH=./temp
INSTALL_PATH=./install

rm -rf $TEMP_PATH
rm -rf $INSTALL_PATH

cargo clean