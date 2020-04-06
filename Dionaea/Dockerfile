FROM isif/dionaea0.8:version1

RUN echo 'cat > /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml <<EOF \n\
- name: hpfeeds\n\
  config:\n\
    # fqdn/ip and port of the hpfeeds broker\n\
    server: 10.20.100.100\n\
    port: 10000\n\
    ident: SGU-Dio-1-Alsut\n\
    secret: password1234\n\
    # dynip_resolve: enable to lookup the sensor ip through a webservice\n\
    #dynip_resolve: "http://canhazip.com/"\n\
    # Try to reconnect after N seconds if disconnected from hpfeeds broker\n\
    # reconnect_timeout: 10.0\n\
EOF\n'\
>> test.sh

RUN cat test.sh

RUN chmod +x test.sh

RUN ls -al

RUN cat test.sh

RUN ./test.sh

RUN cat /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml

RUN /opt/dionaea/bin/dionaea -l all,-debug -L '*'
