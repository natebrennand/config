#!/bin/bash

sudo mv /Library/Preferences/SystemConfiguration/*                                    ~/Desktop/wifi_backup/
#mv /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist              ~/Desktop/wifi_backup/
#mv /Library/Preferences/SystemConfiguration/com.apple.PowerManagement.plist      ~/Desktop/wifi_backup/
#mv /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist  ~/Desktop/wifi_backup/
#mv /Library/Preferences/SystemConfiguration/com.apple.smb.server.plist           ~/Desktop/wifi_backup/
#mv /Library/Preferences/SystemConfiguration/preferences.plist                    ~/Desktop/wifi_backup/

echo "WiFi files now backed up on your desktop"
echo "You should restart to allow OS X to regenerate the WiFi files and hopefully work"

