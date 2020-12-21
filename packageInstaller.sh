#!/bin/bash
# Pi Package Installer - Prevent repos and Large Downloads from ruining a program install
# by Nick Haley

# Programs and Dependencies here - for simple review and edits
BasicFeatures="fail2ban git"
MJPGStreamer="cmake libjpeg8-dev gcc g++ imagemagick ffmpeg libv4l-dev cmake"
OctoPrint="python3-pip python3-dev python3-setuptools python3-virtualenv git libyaml-dev build-essential"
HAProxy="haproxy"

# Add all Dependencies to List
ProgramList="$BasicFeatures $MJPGStreamer $OctoPrint $HAProxy"

# Update then Install List
sudo apt-get update -y
sudo apt-get install -y $ProgramList
exit 0