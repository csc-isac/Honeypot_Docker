FROM isif/cowrie-dionaea:version1

USER cowrie

RUN cd ~/cowrie

RUN ls -al
# home/cowrie/cowrie/cowrie-env/bin/activate


RUN sed -i 's/hostname = svr04/hostname = server-production/g' cowrie.cfg
RUN sed -i 's/#\[output_hpfeeds\]/[output_hpfeeds]/g' cowrie.cfg
RUN sed -i '/\[output_hpfeeds\]/!b;n;cenabled = true' cowrie.cfg
RUN sed -i "s/#server = hpfeeds.mysite.org/server = 10.20.100.100/g" cowrie.cfg
RUN sed -i "s/#port = 10000/port = 10000/g" cowrie.cfg
RUN sed -i "s/identifier = abc123/identifier = cowrie123/g" ~/cowrie/etc/cowrie.cfg
RUN sed -i "s/secret = secret/secret = secret123/g" ~/cowrie/etc/cowrie.cfg
RUN sed -i 's/#debug=false/debug=false/' cowrie.cfg

RUN . home/cowrie/cowrie/cowrie-env/bin/activate && home/cowrie/cowrie/bin/cowrie start 
# && tail -f ~/cowrie/var/log/cowrie/cowrie.log

USER root

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

RUN cat test.sh

RUN chmod +x test.sh

RUN ls -al

RUN cat test.sh

RUN ./test.sh

RUN cat /opt/dionaea/etc/dionaea/ihandlers-enabled/hpfeeds.yaml

RUN /opt/dionaea/bin/dionaea -l all,-debug -L '*'
