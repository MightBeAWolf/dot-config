#!/bin/bash

CONFIGDIR="$(dirname $0)"
while [[ 0 -eq 0 ]]; do
  BATTERY="$(${CONFIGDIR}/battery.sh)"
  DATE="$(date +'%a %b %d %I:%M %p')"
  echo "${BATTERY} | ${DATE}"
  sleep 1
done

