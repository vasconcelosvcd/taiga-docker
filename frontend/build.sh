#! /bin/bash

rm -rf build
mkdir build

cp -r /data/taiga build

sudo docker build -t ipedrazas/taiga-front .

rm -rf build