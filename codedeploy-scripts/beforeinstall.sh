#!/bin/bash

cd /opt/codedeploy-agent/deployment-root/37f8ab82-7f66-4fad-b1f1-fc0b488112c7/d-R18PVUEC4/deployment-archive
chmod +x gradlew

# Compilamos la aplicación con Gradle para obtener un fichero en formato WAR
./gradlew war

# Movemos la aplicación compilada a la carpeta de despliegue de Tomcat
cd ./build/libs
archivo=`ls`
mv $archivo ./hola.war
