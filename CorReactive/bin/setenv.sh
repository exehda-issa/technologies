#!/bin/sh

## run via '. setenv.sh'
##
##

if [ -z "${JAVA_HOME}" ]
then
  echo "JAVA_HOME not set"
  exit 0
fi

if [ ! -x "${JAVA_HOME}/bin/java" ]
then
  echo Cannot find java executable, check JAVA_HOME
  exit 0
fi

#LIB=../../../esper/lib
LIB=../lib

CLASSPATH=.
#CLASSPATH=$CLASSPATH:../target/classes
#CLASSPATH=$CLASSPATH:../../../esper-6.0.1.jar
CLASSPATH=$CLASSPATH:$LIB/*

export CLASSPATH="$CLASSPATH"
