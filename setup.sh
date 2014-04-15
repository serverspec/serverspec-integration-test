#!/bin/sh

sudo gem install rspec       --no-ri --no-rdoc
sudo gem install octorelease --no-ri --no-rdoc

if [ $WERCKER_GIT_REPOSITORY = 'specinfra' ]; then
  rake build
  sudo gem install pkg/specinfra-*.gem --no-ri --no-rdoc
  sudo gem install serverspec --no-ri --no-rdoc
elif [ $WERCKER_GIT_REPOSITORY = 'serverspec' ]; then
  rake build
  sudo gem install pkg/serverspec-*.gem --no-ri --no-rdoc
else
  sudo gem install serverspec --no-ri --no-rdoc
fi

cd $WORKING_DIR

sudo gem install berkshelf -v 2.0.15 --no-ri --no-rdoc
berks install --path=cookbooks

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.1_x86_64.deb
sudo dpkg -i vagrant_1.5.1_x86_64.deb

vagrant plugin install vagrant-digitalocean

vagrant plugin install vagrant-omnibus
