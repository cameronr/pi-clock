#!/bin/bash

# Get current hour (24-hour format)
CURRENT_HOUR=$(date +%H)

# Set brightness based on time of day
if [ "$CURRENT_HOUR" -ge 7 ] && [ "$CURRENT_HOUR" -lt 21 ]; then
    # Daytime (7:00 AM to 7:59 PM): set brightness to 200
    BRIGHTNESS=200
else
    # Nighttime (8:00 PM to 6:59 AM): set brightness to 50
    BRIGHTNESS=20
fi

# Apply the brightness setting
echo "$BRIGHTNESS" | sudo tee /sys/class/backlight/*/brightness

# Log the change (optional)
# echo "$(date): Set brightness to $BRIGHTNESS" >> /var/log/brightness.log
