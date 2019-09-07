#!/bin/bash

rm -rf master.zip jd-gui-master

wget https://github.com/java-decompiler/jd-gui/archive/master.zip -O master.zip
unzip -qq master.zip
cd jd-gui-master
./gradlew build

