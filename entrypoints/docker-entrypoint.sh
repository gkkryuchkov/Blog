#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
rm -rf /app/tmp 2>/dev/nell
rm -rf /tmp/rails-application
mkdir /tmp/rails-application
ln -s /tmp/rails-application /app/tmp
# bundle exec rails db:create db:migrate
bundle exec rails s -b 0.0.0.0