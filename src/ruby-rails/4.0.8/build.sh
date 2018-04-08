#!/bin/bash -x
# cve-2016-0752 测试环境

cd /
source /etc/profile.d/rvm.sh

git clone https://github.com/forced-request/rails-rce-cve-2016-0752.git
cd rails-rce-cve-2016-0752
yum install -y nodejs

gem install bundler
bundle update actionpack
bundle install

exit 0
