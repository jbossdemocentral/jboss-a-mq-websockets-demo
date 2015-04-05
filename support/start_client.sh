#!/bin/sh

PRJ_DIR=../projects/jboss-a-mq-websocket-demo/web
MVN_CMD='mvn jetty:run'

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

echo
echo Starting web client application
echo Open your browser to http://localhost:8282/stocks-activemq.html
echo
cd $PRJ_DIR
$MVN_CMD
