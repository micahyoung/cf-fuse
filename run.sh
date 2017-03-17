#!/bin/bash

echo `pkg-config fuse --cflags --libs`

pushd fuse-rofs
  gcc -Wall \
    -o rofs rofs.c \
    `pkg-config fuse --cflags --libs`
  
popd

mkdir ro
fuse-rofs/rofs rw ro 

ls -lar
