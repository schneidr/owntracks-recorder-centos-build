#!/bin/env bash

PATH=$PATH:/usr/local/go/bin/
CGO_ENABLED=1

if [ -z "${RECORDER_VERSION}" ];
then
    echo "Hugo version missing"
    echo "Example usage:"
    echo "docker run -it --rm -v \$PWD:/work -e RECORDER_VERSION=0.105.0 hugo-build-centos:latest"
    exit 1
fi

wget wget https://github.com/owntracks/recorder/archive/refs/tags/${RECORDER_VERSION}.tar.gz
tar xfz ${RECORDER_VERSION}.tar.gz
cp config.mk recorder-${RECORDER_VERSION}/
cd recorder-${RECORDER_VERSION}
make
mv ocat ot-recorder ../
cp /usr/lib64/libconfig.so.9.1.3 ../libconfig.so.9
cd ..
rm -rf recorder-${RECORDER_VERSION} ${RECORDER_VERSION}.tar.gz
