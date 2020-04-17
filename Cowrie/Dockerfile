FROM isif/cowrie_rd:version1
# Using cowrie-dionaea version 3 from ISIF docker-hub

USER cowrie
# To access the cowrie resource the user should be changed into cowrie basically su cowrie

RUN cd ~/cowrie
# All the cowrie resource is loacted at /home/cowrie/cowrie so with cd ~/cowrie basically we accessing the following path

RUN ls -al
# home/cowrie/cowrie/cowrie-env/bin/activate


RUN sed -i 's/hostname = svr04/hostname = server/g' cowrie.cfg
# we can change the hostname here or uncomment it to use the default setting (svr04)

#RUN sed -i "s/server = 10.20.100.100 = $HPF_HOST/g" cowrie.cfg
# this is a command to access cowrie.cfg and change the hpfeeds server you can change to whatever you want but for this testing the IP used is 10.20.100.100 you can change it to the IP that run Hpfeeds.

#RUN sed -i "s/port = 10000/port = $HPF_PORT/g" cowrie.cfg
# this is a command to access cowrie.cfg and change the hpfeeds port the default is 10000, if you have differnt port uncomment it and change

RUN sed -i "s/identifier = SGU-Cow-2-Alsut/identifier = cowrie123/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and to modify the identifier the default is cowrie123 and the production identifier is ORG-HP-#-Location ask the administrator to add your own identifier along with secret

#RUN sed -i "s/secret = password1234/secret = secret123/g" ~/cowrie/etc/cowrie.cfg
# this is a command to access cowrie.cfg and to modify the secret if you have different secret you can uncomment it and put your secret at the SECRET-FOR-IDENTIFIER field

