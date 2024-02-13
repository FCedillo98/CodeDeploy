#!/bin/bash
cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive
chmod +x gradlew
# Compilamos la aplicación con Gradle para obtener un fichero en formato WAR
./gradlew war
