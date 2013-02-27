# Example showing How to use WebSocket HTML 5 with JBoss A-MQ

Setup and Configuration
-----------------------

See Quick Start Guide in project as ODT and PDF for details on installation. For those that can't wait:

- see README in 'installs' directory

- add product 

- run 'init.sh' & read output

- read Quick Start Guide (coming soon).

- setup JBDS for project import, add jboss-a-mq server (coming soon).

- import projects

- start JBoss a-mq using the shell or .bat script under bin directory bin/a-mq

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

- when the JBoss-AMQ console appears, install the activemq-websocket war file. This war file contains the web project and stomp javascript clients used to open communication between the web browser and websocket server running in JBoss A-MQ.

    JBossA-MQ:karaf@root>install -s war:mvn:org.fusesource.examples.activemq.websocket/web/1.0/war\?Webapp-Context=activemq-websocket

- start Feeder application, which will populate randomly data (stock prices) and publish them in a topic which is the  topic used by websocket to expose the date to the web browser. You will find this in the 'support' directory.

    start_feeder.sh

- open your web browser and point to the following URL:  http://localhost:8181/activemq-websocket/stocks-activemq.html

- click on connect button, login is 'guest':'password'

- consult stock prices!

