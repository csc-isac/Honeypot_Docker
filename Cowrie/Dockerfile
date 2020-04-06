FROM isif/cowrie_rd:version1

USER cowrie

RUN cd ~/cowrie

RUN ls -al
# home/cowrie/cowrie/cowrie-env/bin/activate


#RUN sed -i 's/hostname = svr04/hostname = server/g' cowrie.cfg
#RUN sed -i 's/listen_endpoints = tcp:2222:interface=0.0.0.0/listen_endpoints = tcp:22:interface=0.0.0.0/g' cowrie.cfg
#RUN sed -i 's/version = SSH-2.0-OpenSSH_6.0p1 Debian-4+deb7u2/version = SSH-2.0-OpenSSH_6.7p1 Ubuntu-5ubuntu1.3/g' cowrie.cfg
#RUN sed -i 's/#\[output_hpfeeds\]/[output_hpfeeds]/g' cowrie.cfg
#RUN sed -i '/\[output_hpfeeds\]/!b;n;cenabled = true' cowrie.cfg
#RUN sed -i "s/server = 10.20.100.100 = $HPF_HOST/g" cowrie.cfg
#RUN sed -i "s/port = 10000/port = $HPF_PORT/g" cowrie.cfg
RUN sed -i "s/identifier = SGU-Cow-2-Alsut/identifier = cowrie123/g" ~/cowrie/etc/cowrie.cfg
RUN sed -i "s/secret = password1234/secret = secret123/g" ~/cowrie/etc/cowrie.cfg
#RUN sed -i 's/#debug=false/debug=false/' cowrie.cfg

RUN . home/cowrie/cowrie/cowrie-env/bin/activate && home/cowrie/cowrie/bin/cowrie start && tail -f ~/cowrie/var/log/cowrie/cowrie.log
