#!/bin/bash
# Author Mokeddem Sid Ahmed
# <sidahmed.mokadem@univ-mosta.dz


# install pip if doesn't exist
if ! command_exists pip ; then
    sudo apt-get -y install python-pip
fi

# install docker
sudo pip install docker

# Download Docker-compose release
# install it under /usr/local/bin/
sudo curl -L $(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url \
    | grep docker-compose-`uname -s`-`uname -m` | cut -d '"' -f 4) -o /usr/local/bin/docker-compose

# Make sure the permissions are correct
sudo chmod 0755 /usr/local/bin/docker-compose

# Docker Compose shall print its version information now
/usr/local/bin/docker-compose version

# (optional) Install BASH completion for Docker Compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

# Make sure the permissions are correct
sudo chmod 0644 /etc/bash_completion.d/docker-compose

# pulling latest version of postgres
docker pull postgres:9.6

if [ ! -f docker-compose.yml ]; then
    echo ${red}${bold}"You are not on a docker-compose project"${normal}
    exit 1
fi
echo ${red}${bold}"Starting postgres database"${normal}
docker-compose up -d

docker exec -i database pg_restore -U isi  -d isi < example.dump
