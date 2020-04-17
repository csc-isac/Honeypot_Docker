
version: '3.4'

volumes:
  cowrie-etc:
  cowrie-var:

services:
  cowrie:
    image: isif/cowrie_rd:version1
  dionaea:
    image: isif/dionaea0.8:version1
