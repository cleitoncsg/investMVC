#!/bin/bash

#Grails
echo "Instalando o Grails versão 2.3.8"

curl -s get.gvmtool.net | bash
source "$HOME/.gvm/bin/gvm-init.sh"
gvm install grails 2.3.8
grails -version

#Wine
echo "Instalando o Wine"
sudo apt-get install wine

