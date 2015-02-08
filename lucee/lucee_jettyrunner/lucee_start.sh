#!/bin/sh

##########################################################################

#    Lucee Startup script for linux
#    Requires Java JDK 7+ setup correctly
#    Java 8+ recommended, Java 7 public updates cease on 4/2015
#    David Seong <melinite@gmail.com> 

#    sh lucee_start.sh nohup 
#    for background mode
##########################################################################



#  set name of lucee war
LUCEE_WAR=lucee-4.5.1.000.war

#  set jetty base MUST HAVE "work" directory to keep app deployed staticly
JETTY_BASE=.

#  port to serve
JETTY_PORT=8080

#  context path *when serving request and runner file
JETTY_CONTEXT="/"
JETTY_RUNNER="jetty-runner.jar"

#  jvm opts
JAVA_OPTS="-Xms512m -Xmx512m"

# basic work folder check .. can be omitted if you want to save nothing.
mkdir -p $JETTY_BASE/work


# keep process tracked in case of PID
PIDFILE="$JETTY_BASE/lucee.pid"

if [ "$1" = "nohup" ]
then
  nohup java $JAVA_OPTS -Djetty.base=$JETTY_BASE -jar $JETTY_RUNNER --port $JETTY_PORT --path $JETTY_CONTEXT  $LUCEE_WAR >> jettyrunner_stdout.log 2>&1 & echo $! > $PIDFILE
else
  java $JAVA_OPTS -Djetty.base=$JETTY_BASE -jar $JETTY_RUNNER --port $JETTY_PORT --path $JETTY_CONTEXT  $LUCEE_WAR
fi  


