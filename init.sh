#!/bin/sh 
DEMO="JBoss A-MQ Websocket Demo"
VERSION=6.0.0
AMQ=jboss-a-mq-6.0
AMQ_BIN=jboss-a-mq-6.0.0.GA.zip
DEMO_HOME=./target
AMQ_HOME=$DEMO_HOME/$AMQ
SERVER_CONF=$AMQ_HOME/etc
SRC_DIR=./installs
PRJ_DIR=./projects/jboss-a-mq-websocket-demo


echo
echo "Setting up the Red Hat ${DEMO} environment..."
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$AMQ_BIN || -L $SRC_DIR/$AMQ_BIN ]]; then
		echo JBoss A-MQ sources are present...
		echo
else
		echo Need to download $AMQ_BIN package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi


# Create the target directory if it does not already exist.
if [ ! -x $DEMO_HOME ]; then
		echo "  - creating the demo home directory..."
		echo
		mkdir $DEMO_HOME
else
		echo "  - detected demo home directory, moving on..."
		echo
fi


# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $AMQ_HOME ]; then
		echo "  - existing JBoss A-MQ detected..."
		echo
		echo "  - moving existing JBoss A-MQ aside..."
		echo
		rm -rf $AMQ_HOME.OLD
		mv $AMQ_HOME $AMQ_HOME.OLD

		# Unzip the JBoss A-MQ instance.
		echo Unpacking JBoss A-MQ $VERSION
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$AMQ_BIN
else
		# Unzip the JBoss A-MQ instance.
		echo Unpacking new JBoss A-MQ...
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$AMQ_BIN
fi


echo "  - enabling demo accounts logins in users.properties file..."
echo
cp support/users.properties $SERVER_CONF

echo "  - copying updated JBoss A-MQ configuration file fuseamq-websocket.xml from project..."
echo
cp $PRJ_DIR/feeder/src/main/config/fuseamq-websocket.xml $SERVER_CONF/activemq.xml

echo "  - making sure 'a-mq' for server is executable..."
echo
chmod u+x $AMQ_HOME/bin/a-mq

echo Now going to build the Feeder project.
echo
cd $PRJ_DIR
mvn clean install -DskipTests

echo
echo To get started see the README.md file:
echo
cd ../..
cat README.md

echo Red Hat $DEMO $VERSION Setup Completed.
echo

