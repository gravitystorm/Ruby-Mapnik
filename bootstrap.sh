#!/bin/bash

set -e

# Sort out locales

locale-gen en_GB.UTF-8

# Things included by travis
apt-get update -y
apt-get -y install software-properties-common ruby1.9.1 ruby1.9.1-dev
apt-get -y install autoconf make

# Travis from this point onwards
apt-add-repository --yes ppa:mapnik/nightly-2.3
apt-add-repository --yes ppa:mapnik/nightly-trunk
apt-get update -y

apt-get -y install g++ gcc
apt-get -y install gcc-4.8 g++-4.8
gem install rake-compiler rake hoe rice chunky_png cairo

apt-get -y install libmapnik=2.3.0* mapnik-utils=2.3.0* libmapnik-dev=2.3.0* mapnik-input-plugin*=2.3.0*

# change to the test-kitchen directory
cd /tmp/kitchen/data/
make clean
make test
