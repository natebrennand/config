#!/bin/bash

sudo cp ~/Desktop/wifi_backup/* /Library/Preferences/SystemConfiguration/

echo "WiFi files now taken from your desktop and replaced in the preferences folder"
echo "You should restart to allow OS X to regenerate the WiFi files and hopefully work"

