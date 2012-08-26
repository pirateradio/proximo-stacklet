#!/bin/sh

# capture root dir
root=$(pwd)

# change into subdir of archive
cd $root/dante-*

# configure and compile
./configure --prefix=/app/vendor --enable-static=yes
make install

# clean up
rm -rf $root/*
mv /app/vendor/* $root/
