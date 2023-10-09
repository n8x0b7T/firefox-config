#!/bin/bash


update=false

for arg in "$@"; do
  if [[ "$arg" == "-u" ]]; then
    update=true
    break
  fi
done


# use correct command
if command -v doas >/dev/null 2>&1; then
    sudo="doas"
elif command -v sudo >/dev/null 2>&1; then
    sudo="sudo"
else
    echo "Neither doas nor sudo is installed. Please install either of them."
    exit 1
fi

if [ ! -f "/usr/bin/firefox" ]; then
    echo "Please install firefox"
    exit 1
fi

if [ ! -d "/usr/lib/firefox" ]; then
    echo "Can not find firefox directory"
    exit 1
fi

# if [ -z "$1" ] || [ ! -f "$1/prefs.js" ]; then
#     echo "Please suply a valid firefox profile directory as the first positional argument"
#     exit
# fi

killall firefox 2> /dev/null

echo "Changing global configs"
"$sudo" mkdir -p /usr/lib/firefox/defaults/pref
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/autoconfig.js" > /usr/lib/firefox/defaults/pref/autoconfig.js'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/firefox.cfg" > /usr/lib/firefox/firefox.cfg'
if ! $update; then
    "$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/policies.json" > /usr/lib/firefox/distribution/policies.json'
    rm -r ~/.mozilla
    firefox 2>/dev/null & command_pid=$!

    # Wait for the command to exit
    echo "Please close firefox after it opens and installs the extensions"
    wait "$command_pid"
    # remove the file so the users can change settings after the fact
    "$sudo" rm /usr/lib/firefox/distribution/policies.json
fi

profile_expansion=(~/.mozilla/firefox/*.default-release)
profile_dir=${profile_expansion[1]}
echo -e "\nYour profile is $profile_dir"
read -rp "Do you want to continue? (Y/n): " choice </dev/tty

if [[ "$choice" == "n" || "$choice" == "N" ]]; then
    echo "Ok, fine."
    exit
fi

echo -e "\nChanging user profile"
# remove user.js if it exists
rm "$profile_dir/user.js" 2> /dev/null
# setup custom settings
curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/user-overrides.js" > "$profile_dir/user-overrides.js"
# get fresh copy of user.sh
curl -s "https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh" | bash -s -- -p "$profile_dir" -s


echo "Done."
echo "Don't forget to set your search engine!"

# open preferences
nohup firefox --preferences >/dev/null 2>&1 &

