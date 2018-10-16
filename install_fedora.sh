#############################################################
# Fichier     :  install_fedora.sh
# Auteur      :  ERROR23
# Email       :  error23.d@gmail.com
# OS          :  Linux
# Compilateur :  bash
# Date        :  16/10/2018
# Description :  installate openalpr on fedora
#############################################################
#!/bin/bash


figlet "FEDORA OPENALPR"

if [ -z $1 ]
then
	echo -e "\n"
	read -n1 -p 'OpenAlpr > Do you want to download dependencies with dnf (y/n) ? ' downloadDependencies
else
	downloadDependencies=$1
fi


if [ $downloadDependencies == 'y' ] || [ $downloadDependencies == 'Y' ]
then
	echo -e "\n"
	sudo dnf install opencv-devel tesseract-devel leptonica-devel git cmake log4cplus-devel libcurl-devel gcc-c++ beanstalkd
elif [ $downloadDependencies != 'n' ] && [ $downloadDependencies != 'N' ]
then
	echo -e "\nOpenAlpr > You have to chose between y(es) or n(o)"
	exit -1;
fi

echo -e "\nOpenAlpr > Installng openalpr to your system"

cd src
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc ../src
make
sudo make install
sudo ldconfig

