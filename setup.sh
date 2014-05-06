#!/bin/sh

if [ $WERCKER_GIT_REPOSITORY = 'specinfra' ]; then
  rake build
  sudo gem install pkg/specinfra-*.gem --no-ri --no-rdoc
  sudo gem install serverspec -v 2.0.0.beta2 --no-ri --no-rdoc
elif [ $WERCKER_GIT_REPOSITORY = 'serverspec' ]; then
  rake build
  sudo gem install specinfra -v 2.0.0.beta2 --no-ri --no-rdoc
  sudo gem install pkg/serverspec-*.gem --no-ri --no-rdoc
else
  sudo gem install specinfra -v 2.0.0.beta2 --no-ri --no-rdoc
  sudo gem install serverspec -v 2.0.0.beta2 --no-ri --no-rdoc
fi

cd $WORKING_DIR

berks install --path=cookbooks
