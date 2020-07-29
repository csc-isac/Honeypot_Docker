FROM isif/dionaea0.8:version2

RUN sed -i "s/errors.levels=warning,error/errors.levels=error/g" /opt/dionaea/etc/dionaea/dionaea.cfg
# This command is to modify the dionaea cfg and to decide what should be logged

RUN sed -i "s/default.levels=all/default.levels=error/g" /opt/dionaea/etc/dionaea/dionaea.cfg
# This command is to modify the dionaea cfg and to decide what should be logged because the default is all it's will be heavy to log all the log so the log should capture only the error

RUN echo 'cat > /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml <<EOF \n\
- name: hpfeeds\n\
  config:\n\
    # fqdn/ip and port of the hpfeeds broker\n\
    server: 103.19.110.157\n\
    port: 10000\n\
    ident: SGU-Dio-1-Alsut\n\
    secret: password1234\n\
    # dynip_resolve: enable to lookup the sensor ip through a webservice\n\
    #dynip_resolve: "http://canhazip.com/"\n\
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

