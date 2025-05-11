#!/bin/bash
set -e
set -eo pipefail

TEMP_PATH=./temp
BINDINGS_PATH=$TEMP_PATH/bindings
INSTALL_PATH=$TEMP_PATH/framework

PACKAGE_NAME=uniffi_swift_framework
SOURCE_LIB_PATH=./target/release/lib${PACKAGE_NAME}.a

mkdir -p $TEMP_PATH
mkdir -p $BINDINGS_PATH
mkdir -p $INSTALL_PATH
mkdir -p $INSTALL_PATH/Sources/

cargo build --release

cargo run --bin uniffi-bindgen generate --library $SOURCE_LIB_PATH --language swift --out-dir $BINDINGS_PATH

mv $TEMP_PATH/bindings/$PACKAGE_NAME.swift $INSTALL_PATH/Sources/$PACKAGE_NAME.swift
mv $TEMP_PATH/bindings/${PACKAGE_NAME}FFI.modulemap $TEMP_PATH/bindings/module.modulemap

cargo build --release --target=aarch64-apple-ios-sim
cargo build --release --target=aarch64-apple-ios
cargo build --release --target=aarch64-apple-darwin

xcodebuild -create-xcframework \
    -library ./target/aarch64-apple-ios-sim/release/lib${PACKAGE_NAME}.a -headers $BINDINGS_PATH \
    -library ./target/aarch64-apple-ios/release/lib${PACKAGE_NAME}.a -headers $BINDINGS_PATH \
    -library ./target/aarch64-apple-darwin/release/lib${PACKAGE_NAME}.a -headers $BINDINGS_PATH \
    -output "${INSTALL_PATH}/${PACKAGE_NAME}FFI.xcframework"