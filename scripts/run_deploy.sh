#!/bin/sh

bundle install --gemfile=.fastlane/Gemfile 
BUNDLE_GEMFILE=.fastlane/Gemfile bundle exec fastlane start_deploy

# precompiled
echo -e "plugin 'cocoapods-precompiled'\n$(cat Podfile)" > Podfile
echo "gem 'cocoapods-precompiled', :git => '$COCOAPODS_PRECOMPILED_SOURCE'" >> Gemfile
bundle install
bundle exec pod install
bundle exec pod precompiled create
bundle exec pod precompiled publish