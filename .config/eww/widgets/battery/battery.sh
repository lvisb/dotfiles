#!/bin/bash

# upower -i /org/freedesktop/UPower/devices/battery_BAT0
loaded=false

battery_info() {
  local info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

  echo "$info"
}

battery_percent() {
  local percent=$(echo "$(battery_info)" | grep percentage | grep -oE '[0-9]+' | head -n1)

  echo "$percent"
}

battery_cycles() {
  local cycles=$(echo "$(battery_info)" | grep "charge-cycles" | grep -oE '[0-9]+' | head -n1)

  echo "$cycles"
}

battery_icon() {
  local percent=$(battery_percent)
  local state=$(echo "$(battery_info)" | grep state | awk '{print $2}')
  local is_charging=0

  if [ $state == "charging" ]; then
    is_charging=1
  else
    is_charging=0
  fi

  if [ $percent -ge 95 ] || [ $state == "fully-charged" ] ; then
    echo ""
  elif [ $percent -ge 60 ]; then
    echo ""
  elif [ $percent -ge 40 ]; then
    echo ""
  elif [ $percent -ge 10 ]; then
    echo ""
  else
    echo ""
  fi
}

json() {
  local cycles=$(printf "%'d" $(battery_cycles))

  json="{"
  json+="\"battery_icon\":\"$(battery_icon)\","
  json+="\"battery_percent\":\"$(battery_percent)\","
  json+="\"battery_cycles\":\"${cycles//,/.}\""
  json+="}"

  echo "$json"
}

if [[ $loaded == false ]]; then
  loaded=true

  echo "$(json)"
fi

upower --monitor-detail | while read -r event; do
  if [[ $event == *"change"* ]]; then
    echo "$(json)"
  fi
done

