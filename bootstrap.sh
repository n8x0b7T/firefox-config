#!/bin/bash

# Default value for update flag
update=false

# Check if the -u flag was passed
for arg in "$@"; do
  if [[ "$arg" == "-u" ]]; then
    update=true
    break
  fi
done

# Use correct command
if command -v doas >/dev/null 2>&1; then
    sudo="doas"
elif command -v sudo >/dev/null 2>&1; then
    sudo="sudo"
else
    echo "Neither doas nor sudo is installed. Please install either of them."
    exit 1
fi

# Ensure Firefox is installed
if [ ! -f "/usr/bin/firefox" ]; then
    echo "Please install Firefox"
    exit 1
fi

# Ensure Firefox directory exists
if [ ! -d "/usr/lib/firefox" ]; then
    echo "Cannot find Firefox directory"
    exit 1
fi

# Kill any running Firefox processes
killall firefox 2>/dev/null || true

echo "Changing global configs"
"$sudo" mkdir -p /usr/lib/firefox/defaults/pref
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/autoconfig.js" -o /usr/lib/firefox/defaults/pref/autoconfig.js'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/firefox.cfg" -o /usr/lib/firefox/firefox.cfg'

# If not updating, install policies and remove user profile
if ! $update; then
    "$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/policies.json" -o /usr/lib/firefox/distribution/policies.json'
    rm -r ~/.mozilla
    firefox 2>/dev/null & command_pid=$!

    # Wait for Firefox to exit
    echo "Please close Firefox after it opens and installs the extensions"
    wait "$command_pid"
    
    # Remove policies.json after Firefox closes
    "$sudo" rm /usr/lib/firefox/distribution/policies.json
fi

# Expand the profile directory
profile_dir=$(find "$HOME/.mozilla/firefox/" -type d -name '*.default-release' | head -n 1)

if [ -z "$profile_dir" ]; then
    echo "No Firefox profile found."
    exit 1
fi

echo -e "\nYour profile is $profile_dir"
read -rp "Do you want to continue? (Y/n): " choice

if [[ "$choice" == "n" || "$choice" == "N" ]]; then
    echo "Ok, fine."
    exit
fi

echo -e "\nChanging user profile"
# Remove user.js if it exists
rm "$profile_dir/user.js" 2>/dev/null || true

# Set up custom settings
curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/user-overrides.js" -o "$profile_dir/user-overrides.js"

# Get fresh copy of user.js
curl -s "https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh" | bash -s -- -p "$profile_dir" -s

echo "Done."
echo "Don't forget to set your search engine!"

# Open preferences
nohup firefox --preferences >/dev/null 2>&1 &

