#############################################################
# Fichier     :  build_fedora.sh
# Auteur      :  ERROR23
# Email       :  error23.d@gmail.com
# OS          :  Linux
# Compilateur :  bash
# Date        :  15/10/2018
# Description :  builds the c projct for fedora
#############################################################
#!/bin/bash

sudo dnf install opencv-devel tesseract-devel leptonica-devel git cmake log4cplus-devel libcurl-devel gcc-c++ beanstalkd

cd src
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc ../src

make

echo "launch sudo make install && sudo ldconfig if u want to install alpr localy"




