#!/usr/bin/env bash

export M2_HOME=/opt/maven
export M2_BIN=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=500m -Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"

export PATH=${PATH}:$M2_BIN