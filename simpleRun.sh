apt-get update && apt-get upgrade -y
apt-get install docker.io docker-compose

docker-compose up -d --build
docker exec honeypotdocker_cowrie_1 /bin/sh -c "cd ~/cowrie ; source cowrie-env/bin/activate ; bin/cowrie start"
docker exec honeypotdocker_dionaea_1 /bin/sh -c "/opt/dionaea/bin/dionaea -l all,-debug -L '*'"
