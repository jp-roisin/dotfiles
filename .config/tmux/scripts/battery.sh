#!/bin/zsh

# Get the battery percentage
battery_level=$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')

# Check if the laptop is charging
charging_status=$(pmset -g batt | grep 'AC Power')

# Select the icon based on the battery level
# https://www.nerdfonts.com/cheat-sheet
if [[ -n "$charging_status" ]]; then
  prepend_icon="\uf0e7"
fi

if [ "$battery_level" -le 20 ]; then
  icon="\uf244"  # No battery
elif [ "$battery_level" -le 40 ]; then
  icon="\uf243"  # Low battery
elif [ "$battery_level" -le 60 ]; then
  icon="\uf242"  # Medium-low battery
elif [ "$battery_level" -le 80 ]; then
  icon="\uf241"  # Medium battery
else
  icon="\uf240"  # Full battery
fi

# Output the icon and battery level
echo "$prepend_icon $icon  $battery_level%"
