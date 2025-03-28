#!/bin/bash

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/"$USER"/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/"$USER"/.config/chromium/Default/Preferences

# set brightness
/home/"$USER"/bin/set-brightness.sh

# load API key
# shellcheck source=./env
. "/home/$USER/dev/kep-clock/env"

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk "file:///home/$USER/dev/kep-clock/index.html?apiKey=$PIRATE_WEATHER_API_KEY&lat=$LAT&long=$LONG"
