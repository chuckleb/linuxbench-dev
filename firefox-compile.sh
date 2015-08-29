#!/bin/bash

# Firefox compile test
# Developed for Ubuntu
# 
# NOTE : Many extra libraries installed, extracted from LinuxBench script




export DEBIAN_FRONTEND=noninteractive
export SHELL=/bin/sh make

echo 
echo "Please specify number of threads to compile with:"
read threads


apt-get -y update
apt-get -y install build-essential libx11-dev libglu-dev hardinfo sysbench unzip expect \
		php5-curl php5-common php5-cli php5-gd libfpdi-php gfortran wget cmake libncurses5-dev curl \
		python gtk+-2.0 dbus yasm libasound2-dev libxt-dev zip

cd /dev/shm
wget https://archive.mozilla.org/pub/firefox/releases/40.0/source/firefox-40.0.source.tar.bz2
tar xvfj firefox-40.0.source.tar.bz2
mkdir -p ffbuild; cd ffbuild
../mozilla-release/configure --disable-dbus --disable-pulseaudio --disable-gstreamer --disable-necko-wifi
time make -j $threads


