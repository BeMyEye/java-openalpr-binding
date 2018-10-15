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

cd src/bindings/java/
`make.sh`
mv *.so ../../../


