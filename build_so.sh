#############################################################
# Fichier     :  build_so.sh
# Auteur      :  ERROR23
# Email       :  error23.d@gmail.com
# OS          :  Linux
# Compilateur :  bash
# Date        :  15/10/2018
# Description :  build openAlpr C code
#############################################################
#!/bin/bash

figlet "BeMyEye OpenAlpr Builder"

if [ -z $1 ]
then
	echo -e "\n"
	read -n1 -p 'BeMyEye > Do you want to download dependencies with dnf (y/n) ? ' downloadDependencies
else
	downloadDependencies=$1
fi


if [ $downloadDependencies == 'y' ] || [ $downloadDependencies == 'Y' ]
then
	echo -e "\n"
	sudo dnf install opencv-devel tesseract-devel leptonica-devel git cmake log4cplus-devel libcurl-devel gcc-c++ beanstalkd
elif [ $downloadDependencies != 'n' ] && [ $downloadDependencies != 'N' ]
then
	echo -e "\nBeMyEye > You have to chose between y(es) or n(o)"
	exit -1;
fi

echo -e "\nBeMyEye > Building openAlpr lib"

cd src
cmake ../src
make

cp openalpr/libopenalpr.so.2 ..

echo -e "\nBeMyEye > [DONE]"


echo -e "\nBeMyEye > Building openAlpr JNI lib"
cd bindings/java/
`make.sh`
mv *.so ../../../

echo -e "\nBeMyEye > [DONE]"

