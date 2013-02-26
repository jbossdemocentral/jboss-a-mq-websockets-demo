# Example showing How to use WebSocket HTML 5 with JBoss A-MQ and Camel

## JBoss A-MQ

1) Start JBoss a-mq using the shell or .bat script under bin directory
   bin/a-mq

              _ ____                                __  __  ____
             | |  _ \                    /\        |  \/  |/ __ \
             | | |_) | ___  ___ ___     /  \ ______| \  / | |  | |
         _   | |  _ < / _ \/ __/ __|   / /\ \______| |\/| | |  | |
        | |__| | |_) | (_) \__ \__ \  / ____ \     | |  | | |__| |
         \____/|____/ \___/|___/___/ /_/    \_\    |_|  |_|\___\_\

         JBoss A-MQ (6.0.0.redhat-009)
         http://fusesource.com/products/fuse-mq-enterprise/

       Hit '<tab>' for a list of available commands
       and '[cmd] --help' for help on a specific command.
       Hit '<ctrl-d>' or 'osgi:shutdown' to shutdown JBoss A-MQ.

       JBossA-MQ:karaf@root>

2) When the JBoss-AMQ console appears, install the activemq-websocket war file. This war file contains the
   web project and stomp javascript clients used to open communication between the web browser and websocket
   server running in JBoss A-MQ.

    JBossA-MQ:karaf@root>install -s war:mvn:org.fusesource.examples.activemq.websocket/web/1.0/war\?Webapp-Context=activemq-websocket

3)  Start Feeder application, which will populate randomly data (stock prices) and publish them in a topic which is the 
    topic used by websocket to expose the date to the web browser. You will find this in the 'support' directory.

    start_feeder.sh

4) Open your web browser and point to the following URL.

    http://localhost:8181/activemq-websocket/stocks-activemq.html

5) Click on connect button.

   Remark : The login is 'guest':'password'

   Consult stock prices !

## Camel

1) Start Apache Camel Routes with or without SSL, using file found in 'suppport' directory.

   start_camel_nossl.sh  or  start_camel_ssl.sh

2) Start Feeder application

   start_feeder.sh

3) Verify stock and news websockets in your browser.

    http://localhost:9090/stocks-camel.html
    http://localhost:9090/news-camel.html

    or 

    https://localhost:8443/news-camel-wss.html

    and click on connect button.

