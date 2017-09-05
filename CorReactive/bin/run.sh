#!/bin/sh

. ./setenv.sh

#MEMORY_OPTIONS="-Xms512m -Xmx512m -server -XX:+UseParNewGC"
#MEMORY_OPTIONS="-Xms2g -Xmx2g"
MEMORY_OPTIONS="-Xms1g -Xmx1g -server -XX:+UseParNewGC"

#"%JAVA_HOME%/bin/java" -cp %CR_HOME%/lib/*; %MEMORY_OPTIONS% -Dlog4j.configuration=log4j.xml com.ksoft.cengine.core.Launcher

$JAVA_HOME/bin/java $MEMORY_OPTIONS -Dlog4j.configuration=log4j.xml -cp ${CLASSPATH} com.ksoft.cengine.core.Launcher

#$JAVA_HOME/bin/java -cp %CR_HOME%/lib/*; $MEMORY_OPTIONS -Dlog4j.configuration=log4j.xml com.ksoft.cengine.core.Launcher
