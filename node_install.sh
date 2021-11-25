#!/bin/sh

TARGET_DIR=~/.local/nodejs
VERSION=v17.1.0

wget https://nodejs.org/download/release/latest/node-$VERSION-linux-x64.tar.gz -P /tmp/
rm -rf ${TARGET_DIR}
mkdir -p ~/.local/nodejs
tar -xvf /tmp/node-$VERSION-linux-x64.tar.gz -C $TARGET_DIR
echo export NODEJS_HOME=$(echo $TARGET_DIR/*)
echo 'export PATH=$PATH:$NODEJS_HOME/bin'
