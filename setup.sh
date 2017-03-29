#!/bin/sh

if [ "$WERCKER_GIT_REPOSITORY" = 'specinfra' ]; then
  rake build
  gem install pkg/specinfra-*.gem --no-ri --no-rdoc
  gem install serverspec --pre --no-ri --no-rdoc
elif [ "$WERCKER_GIT_REPOSITORY" = 'serverspec' ]; then
  rake build
  gem install specinfra --pre --no-ri --no-rdoc
  gem install pkg/serverspec-*.gem --no-ri --no-rdoc
else
  gem install specinfra --pre --no-ri --no-rdoc
  gem install serverspec --pre --no-ri --no-rdoc
fi

cd $WORKING_DIR
bundle install

