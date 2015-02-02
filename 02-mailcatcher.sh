#!/bin/sh

if test -n "$MAILCATCHER"
then
  setuser web mailcatcher --smtp-ip 0.0.0.0 --http-ip 0.0.0.0 
fi
