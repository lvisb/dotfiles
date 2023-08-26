#!/bin/bash

# upower -i /org/freedesktop/UPower/devices/battery_BAT0
loaded=false

battery_icon() {
  local info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
  local percent=$(echo "$info" | grep percentage | grep -oE '[0-9]+' | head -n1)
  local state=$(echo "$info" | grep state | awk '{print $2}')
  local is_charging=0

  if [ $state == "charging" ]; then
    is_charging=1
  else
    is_charging=0
  fi

  if [ $percent -ge 99 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂅"
    else
      echo "󰁹"
    fi
  elif [ $percent -ge 90 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂋"
    else
      echo "󰂂"
    fi
  elif [ $percent -ge 80 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂊"
    else
      echo "󰂁"
    fi
  elif [ $percent -ge 70 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂉"
    else
      echo "󰂀"
    fi
  elif [ $percent -ge 60 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂉"
    else
      echo "󰁿"
    fi
  elif [ $percent -ge 50 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰢝"
    else
      echo "󰁾"
    fi
  elif [ $percent -ge 40 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂈"
    else
      echo "󰁽"
    fi
  elif [ $percent -ge 30 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂇"
    else
      echo "󰁼"
    fi
  elif [ $percent -ge 20 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰂆"
    else
      echo "󰁻"
    fi
  elif [ $percent -ge 10 ]; then
    if [ $is_charging == 1 ]; then
      echo "󰢜"
    else
      echo "󰁺"
    fi
  else
    if [ $is_charging == 1 ]; then
      echo "󰢟"
    else
      echo "󰂎"
    fi
  fi
}

json() {
  json="{"
  json+="\"battery_icon\":\"$(battery_icon)\""
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

