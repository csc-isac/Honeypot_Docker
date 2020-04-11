FROM isif/cowrie-dionaea:version3 
# Using cowrie-dionaea version 3 from ISIF docker-hub

USER cowrie
# To access the cowrie resource the user should be changed into cowrie basically su cowrie

RUN cd ~/cowrie
# All the cowrie resource is loacted at /home/cowrie/cowrie so with cd ~/cowrie basically we accessing the following path

RUN sed -i 's/hostname = svr04/hostname = server-production/g' ~/cowrie/etc/cowrie.cfg
# we can change the hostname here or uncomment it to use the default setting (svr04)

RUN sed -i "s/server = hpfeeds.mysite.org/server = 10.20.100.100/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and change the hpfeeds server you can change to whatever you want but for this testing the IP used is 10.20.100.100 you can change it to the IP that run Hpfeeds.

#RUN sed -i "s/port = 10000/port = 10000/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and change the hpfeeds port the default is 10000, if you have differnt port uncomment it and change

RUN sed -i "s/identifier = cowrie123/identifier = SGU-Cow-2-Alsut/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and to modify the identifier the default is cowrie123 and the production identifier is ORG-HP-#-Location ask the administrator to add your own identifier along with secret

#RUN sed -i "s/#secret = password1234/secret = SECRET-FOR-IDENTIFIER/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and to modify the secret if you have different secret you can uncomment it and put your secret at the SECRET-FOR-IDENTIFIER field

#RUN sed -i 's/DAEMONIZE=""/DAEMONIZE="-n"/' bin/cowrie
# this is a command to change the cowrie Daemonize or not, to make the cowrie not a Daemon simply uncomment the command

USER root
# To access the resources that dionaea need we should run as root 

RUN sed -i "s/errors.levels=warning,error/errors.levels=error/g" /opt/dionaea/etc/dionaea/dionaea.cfg
# This command is to modify the dionaea cfg and to decide what should be logged

RUN sed -i "s/default.levels=all/default.levels=error/g" /opt/dionaea/etc/dionaea/dionaea.cfg
# This command is to modify the dionaea cfg and to decide what should be logged because the default is all it's will be heavy to log all the log so the log should capture only the error

RUN echo 'cat > /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml <<EOF \n\
- name: hpfeeds\n\
  config:\n\
    # fqdn/ip and port of the hpfeeds broker\n\
    server: 10.20.100.100\n\
    port: 10000\n\
    ident: SGU-Dio-1-Alsut\n\
    secret: password1234\n\
    # dynip_resolve: enable to lookup the sensor ip through a webservice\n\
    #dynip_resolve: "http://---.com/"\n\
    # Try to reconnect after N seconds if disconnected from hpfeeds broker\n\
    # reconnect_timeout: 10.0\n\
EOF\n'\
>> test.sh
# This is a command to create a bash script called test.sh that is consist of command to modify the hpfeeds.yaml modify the server, port, ident and secret that's all what you need to do

RUN cat test.sh
# This is to check if the test.sh is correct or not

RUN chmod +x test.sh
# This command is to add the executeable field to the test.sh so we can execute it later

RUN ./test.sh
# This command is used to execute the test.sh.

RUN cat /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml
# This command is to check if the test.sh is successfully modified the hpfeeds.yaml value or not.

RUN cat /opt/dionaea/etc/dionaea/dionaea.cfg
# This command is to check for the dionaea.cfg

RUN cd / && ./activator
# This is a command to execute the activator bash script, activator bash script actually a script that is used to run the dionaea and cowrie process.
