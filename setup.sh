#!/bin/sh

if [ $WERCKER_GIT_REPOSITORY = 'specinfra' ]; then
  rake build
  sudo gem install pkg/specinfra-*.gem --no-ri --no-rdoc
  sudo gem install serverspec --pre --no-ri --no-rdoc
elif [ $WERCKER_GIT_REPOSITORY = 'serverspec' ]; then
  rake build
  sudo gem install specinfra --pre --no-ri --no-rdoc
  sudo gem install pkg/serverspec-*.gem --no-ri --no-rdoc
else
  sudo gem install specinfra --pre --no-ri --no-rdoc
  sudo gem install serverspec --pre --no-ri --no-rdoc
fi

cd $WORKING_DIR
bundle install

