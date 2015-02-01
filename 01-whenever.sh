#!/bin/sh

if test -x /app/bin/whenever && test -e /app/config/schedule.rb
then
  cd /app
  whenever --update-crontab
fi
