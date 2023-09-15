#!/bin/bash

loaded=false

volume_icon() {
  local mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

  if [ "$mute_status" = "[MUTED]" ]; then
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

alsactl monitor | while read -r event; do
  if [[ -n "$event" ]]; then
    echo "$(json)"
  fi
done

