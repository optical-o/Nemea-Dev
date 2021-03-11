#!/bin/sh

# Install basic dependencies
(
 rpm --quiet -ih http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
 yum install -y gcc gcc-c++ automake autoconf pkgconfig make libtool wget vim git tree zlib zlib-devel bzip2 bzip2-devel pkgconfig openssl-devel python36-devel python36-setuptools python36-pip gtest-devel gtest-devel bison-devel flex bison libxml2-devel openssl-devel lua-devel git
 echo /usr/local/lib > /etc/ld.so.conf.d/usrlocallib.conf
 curl https://bootstrap.pypa.io/get-pip.py | python3
)

# Get pip3
(
 /usr/local/bin/pip3 install scan-build
)

