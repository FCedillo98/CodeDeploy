#!/bin/bash

cd /opt/tomcat/webapps

app=holamundo
version="-0.0.1-plain"

mv "$app$version.war" "$app.war"
