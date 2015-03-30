#!/bin/sh

ipaddress=`vagrant ssh-config coreos | grep HostName | sed -E -e 's/^.+HostName (.+)$/\1/'`

DOCKER_URL=http://$ipaddress:2375 bundle exec itamae docker --image ubuntu:trusty recipe.rb









