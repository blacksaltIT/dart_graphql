#!/usr/bin/env bash
set -ev

#PATH=$HOME/protoc/bin:$PATH
#protoc --version
pub get
pub run test
#make clean run-tests
