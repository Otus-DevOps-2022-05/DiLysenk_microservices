docker-machine create \
 --driver generic \
 --generic-ip-address=51.250.14.3 \
 --generic-ssh-user ubuntu \
 --generic-ssh-key ~/.ssh/id_ed25519 \
 docker-host

eval $(docker-machine env docker-host)
