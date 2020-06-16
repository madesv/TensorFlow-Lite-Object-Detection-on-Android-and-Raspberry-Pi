#!/bin/bash

# Get packages required for OpenCV

sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev
sudo apt-get -y install qt4-dev-tools libatlas-base-dev

# Need to get an older version of OpenCV because version 4 has errors
pip3 install opencv-python==3.4.6.27

# Get packages required for TensorFlow
# Using the tflite_runtime packages available at https://www.tensorflow.org/lite/guide/python
# Will change to just 'pip3 install tensorflow' once newer versions of TF are added to piwheels

#pip3 install tensorflow

version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

if [ $version == "3.8" ]; then
pip3 install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.2.0-cp38-cp38-manylinux2010_x86_64.whl
fi

if [ $version == "3.7" ]; then
pip3 install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.2.0-cp37-cp37m-manylinux2010_x86_64.whl
fi

if [ $version == "3.5" ]; then
pip3 install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.2.0-cp35-cp35m-manylinux2010_x86_64.whl
fi

