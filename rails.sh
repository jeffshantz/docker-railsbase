#!/bin/sh

cd /app
exec /sbin/setuser web rails server --binding 0.0.0.0 1>/dev/null 2>> /app/log/stderr.log
