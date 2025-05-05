#!/bin/zsh

# Set the correct Wi-Fi interface
wifi_interface="en0"

# Check if Wi-Fi is connected
wifi_status=$(networksetup -getairportnetwork $wifi_interface 2>/dev/null)

if [[ "$wifi_status" == *"You are not associated"* ]]; then
  # Not connected to a network
  echo "\uf1eb 0%"
else
  # Use `airport` to get detailed Wi-Fi information
  # WARNING: The airport command line tool is deprecated and will be removed in a future release.
  # For diagnosing Wi-Fi related issues, use the Wireless Diagnostics app or wdutil command line tool.
  wifi_info=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)

  # Extract RSSI (signal strength)
  signal=$(echo "$wifi_info" | awk '/agrCtlRSSI:/ {print $2}')

  # Convert RSSI to a percentage
  if (( $signal < -90 )); then
      wifi_percentage=0
  elif (( $signal < -80 )); then
      wifi_percentage=25
  elif (( $signal < -70 )); then
      wifi_percentage=50
  elif (( $signal < -60 )); then
      wifi_percentage=75
  else
      wifi_percentage=100
  fi

  # Output the icon and percentage
  echo "\uf1eb  $wifi_percentage%"
fi
