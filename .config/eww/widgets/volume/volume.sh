#!/bin/bash

loaded=false

volume_icon() {
  local mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

  if [ "$mute_status" = "yes" ]; then
    echo "󰝟"
  else
    echo "󰕾"
  fi
}

json() {
  json="{"
  json+="\"volume_icon\":\"$(volume_icon)\""
  json+="}"

  echo "$json"
}

if [[ $loaded == false ]]; then
  loaded=true

  echo "$(json)"
fi

pactl subscribe | while read -r event; do
  if [[ $event == *"change"* ]]; then
    echo "$(json)"
  fi
done

