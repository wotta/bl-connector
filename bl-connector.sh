#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title bl-connect
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🌊
# @raycast.argument1 { "type": "text", "placeholder": "Device" }
# @raycast.packageName wotta/cli-utils
# @raycast.needsConfirmation true

# Documentation:
# @raycast.description This script command helps you to connect to the device that you want
# @raycast.author Wouter van Marrum
# @raycast.authorURL https://github.com/wotta

# First check if device is connected
# If is connected disconnect
# Else connect to device
	# get the mac address from the --paired string
	# connect to mac address
blueutil --paired
