JBoss A-MQ WebSocket HTML 5 Demo Quickstart Guide
=================================================

Demo based on JBoss A-MQ product.

Setup and Configuration
-----------------------

- carefully review the README file in the 'installs' directory because you'll need to tell the init.sh script what version of A-MQ you are using. The current version, as of the last time this file was updated, was jboss-a-mq-6.1.0.redhat-379; if the version you download and deploy to the intalls directory is different, you'll need to make the changes outlined in that file.

- run 'init.sh' and review the output for any errors

- start JBoss a-mq using the shell command amq or .bat script under bin directory target/jboss-a-mq-6.1.0.redhat-379/bin

- when the JBoss-AMQ console appears, install the activemq-websocket war file. This war file contains the web project and stomp javascript clients used to open communication between the web browser and websocket server running in JBoss A-MQ.

    JBossA-MQ:karaf@root>install -s war:mvn:org.jboss.amq.examples.websocket/web/1.0/war\?Web-ContextPath=activemq-websocket

- start Feeder application, which will populate randomly data (stock prices) and publish them in a topic which is the topic used by websocket to expose the date to the web browser. You will find this in the 'support' directory.

    start_feeder.sh

- open your web browser and point to the following URL:  http://localhost:8181/activemq-websocket/stocks-activemq.html

- if you want to run a standalone web server instead instead, you can run the following command from the 'support' directory:

   start_client.sh
   
   open your browser and navigate to http://localhost:8282/stocks-activemq.html

- click on connect button, login is 'guest':'password'

- consult stock prices!


Released versions
-----------------
See the tagged releases for the following verisons of the product:

- v1.0 moved to JBoss Demo Central.

- v1.0 is initial JBoss A-MQ v6 release.

