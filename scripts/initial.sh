#!/bin/sh
echo "installing required imagemagick"
sudo apt-get -y install imagemagick libmagic-dev libmagickwand-dev
echo "completed installing imagemagick"
echo "running the bundle..."
pwd
bundle exec bundle install
echo "gems installed. Now run server.sh to run the server"

