#!/bin/sh
set -e

[ $(id -u) = 0 ] && echo "Please do not run this script as root" && exit 100

echo "Installing dependencies"
sudo apt update
sudo apt install -y build-essential cmake git libfftw3-dev libglfw3-dev libvolk2-dev libzstd-dev libsoapysdr-dev libairspyhf-dev libairspy-dev \
            libiio-dev libad9361-dev librtaudio-dev libhackrf-dev librtlsdr-dev libbladerf-dev liblimesuite-dev p7zip-full wget xrdp

git clone https://github.com/AlexandreRouma/SDRPlusPlus.git
cd SDRPlusPlus

echo "Preparing build"
mkdir -p build
cd build
cmake .. -DOPT_BUILD_LIMESDR_SOURCE=ON -OPT_BUILD_RTL_SDR_SOURCE

echo "Building"
make

echo "Installing"
sudo make install

echo "Done!"
