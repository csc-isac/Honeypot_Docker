FROM isif/cowrie_rd:version1

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

RUN . home/cowrie/cowrie/cowrie-env/bin/activate && home/cowrie/cowrie/bin/cowrie start && tail -f ~/cowrie/var/log/cowrie/cowrie.log
