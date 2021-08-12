#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title bl-connector
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌊
# @raycast.argument1 { "type": "text", "placeholder": "Device" }
# @raycast.packageName wotta/cli-utils
# @raycast.needsConfirmation false

# Documentation:
# @raycast.description This script command helps you to connect/disconnect to the device that you want
# @raycast.author Wouter van Marrum
# @raycast.authorURL https://github.com/wotta

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit
fi

device=$1;

if ! command -v brew &> /dev/null
  then
    echo "❌ cannot continue script"
    exit
fi

if ! command -v blueutil &> /dev/null
then
  echo "↳ installing blueutil using brew"

  brew install blueutil
fi

if ! command -v blueutil &> /dev/null
then
  echo "💥 Could not install blueutil"
else
  mac=$(blueutil --paired | grep -i $device | sed "s/\,.*//;s/.*: //")

  isConnected=$(blueutil --is-connected $mac)

  if [ "$isConnected" -eq "0" ];
  then
    blueutil --connect $mac

    connected=$(blueutil --is-connected $mac)

    if [ "$connected" -eq "0" ];
    then
      echo "💥 failed to connect to $device"
      exit;
    fi

    echo "🎉 connected $device"
    exit;
  fi

  if [ "$isConnected" -eq "1" ];
  then
    blueutil --disconnect $mac

    echo "🔸 disconnected $device"
    exit;
  fi
fi
