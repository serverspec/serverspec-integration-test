FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb
RUN dpkg -i vagrant_1.9.3_x86_64.deb
RUN rm vagrant_1.9.3_x86_64.deb
RUN vagrant plugin install vagrant-digitalocean
RUN apt-get install -y ruby bundler rsync openssh-client git

