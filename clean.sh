#!/bin/bash
set -e
set -eo pipefail

TEMP_PATH=./temp

rm -rf $TEMP_PATH

cargo clean