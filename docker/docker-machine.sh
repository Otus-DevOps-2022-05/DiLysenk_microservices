docker-machine create \
 --driver generic \
 --generic-ip-address=51.250.13.113 \
 --generic-ssh-user ubuntu \
 --generic-ssh-key ~/.ssh/id_ed25519 \
 logging

eval $(docker-machine env logging)
