#!/bin/bash -f

BATTERY="BAT1"
CURRENT="$(cat /sys/class/power_supply/${BATTERY}/charge_now)"
FULL="$(cat /sys/class/power_supply/${BATTERY}/charge_full)"
LEVEL="$((((CURRENT*100))/FULL))"
STATUS="$(cat /sys/class/power_supply/${BATTERY}/status)"

if [[ "${LEVEL}" -le 10 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 20 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 30 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 40 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 50 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 60 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 70 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 80 ]]; then 
  LEVEL_ICON=""
elif [[ "${LEVEL}" -le 90 ]]; then 
  LEVEL_ICON=""
else
  LEVEL_ICON=""
fi


case "${STATUS}" in 
  Charging)
    STATUS_ICON=" "
    ;;
  Discharging)
    STATUS_ICON=" "
    ;;
  *)
    STATUS_ICON="$STATUS "
    ;;
esac

echo "${STATUS_ICON}${LEVEL_ICON}"