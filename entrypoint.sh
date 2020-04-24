#!/bin/bash

set -e
cd /home/vagrant/Linoma_Software

JAVA_OPTS='-Xmx1024m -XX:MaxPermSize=256m -Djava.awt.headless=true -XX:-UseVMInterruptibleIO'
export JAVA_OPTS

PRGDIR=`pwd`

# Use the bundled JRE if one has been bundled
if [ -d "$PRGDIR/jre6" ]
then
  export JAVA_HOME="$PRGDIR/jre6"
elif [ -d "$PRGDIR/jre" ]
then
  export JAVA_HOME="$PRGDIR/jre"
fi

EXECUTABLE=tomcat/bin/goanywhere_catalina.sh

exec "$PRGDIR"/"$EXECUTABLE" run "$@"