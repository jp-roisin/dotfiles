#!/bin/zsh

# Get the battery percentage
battery_level=$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')

# Check if the laptop is charging
charging_status=$(pmset -g batt | grep 'AC Power')

# Select the icon based on the battery level
# https://www.nerdfonts.com/cheat-sheet
if [[ -n "$charging_status" ]]; then
  # Array of charging icons
  if [ "$battery_level" -le 20 ]; then
    icons=("\uf244" "\uf243" "\uf242" "\uf241" "\uf240")  # Nerd Fonts battery icons
  elif [ "$battery_level" -le 40 ]; then
    icons=("\uf243" "\uf242" "\uf241" "\uf240")  # Nerd Fonts battery icons
  elif [ "$battery_level" -le 60 ]; then
    icons=("\uf242" "\uf241" "\uf240")  # Nerd Fonts battery icons
  elif [ "$battery_level" -le 80 ]; then
    icons=("\uf241" "\uf240")  # Nerd Fonts battery icons
  else
    icons=("\uf240")  # Nerd Fonts battery icons
  fi
  # Calculate the current time in seconds and use it to select the icon
  index=$(( ($(date +%s) % ${#icons[@]}) ))  # Ensure index is always valid
  icon=${icons[$((index + 1))]}  # Adjust for Zsh 1-based indexing
else
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
fi

# Output the icon and battery level
echo "$icon  $battery_level%"
