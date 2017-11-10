sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sh -c 'echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list'
echo 'deb http://cz.archive.ubuntu.com/ubuntu trusty main' >> /etc/apt/sources.list

# Install docker
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y libsystemd-journal0
sudo apt-get install -y docker-engine
sudo service docker start

sudo usermod -aG docker $USER

# Docker-compose, check version here before launching https://github.com/docker/compose/tags
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

