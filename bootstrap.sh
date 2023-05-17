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
    exit
fi

if [ ! -d "/usr/lib/firefox" ]; then
    echo "Can not find firefox directory"
    exit
fi

# if [ -z "$1" ] || [ ! -f "$1/prefs.js" ]; then
#     echo "Please suply a valid firefox profile directory as the first positional argument"
#     exit
# fi



echo "Changing global configs"
"$sudo" mkdir -p /usr/lib/firefox/defaults/pref
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/autoconfig.js" > /usr/lib/firefox/defaults/pref/autoconfig.js'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/firefox.cfg" > /usr/lib/firefox/firefox.cfg'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/policies.json" > /usr/lib/firefox/distribution/policies.json'

killall firefox
rm -r ~/.mozilla
firefox 2>/dev/null & command_pid=$!

# Wait for the command to exit
wait "$command_pid"

profile_dir=(~/.mozilla/firefox/*.default-release)
echo "Your profile is $profile_dir"

echo -e " \n\n\nChanging user profile"
curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/user-overrides.js" > "$profile_dir/user-overrides.js"
curl -s "https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh" | bash -s -- -p "$profile_dir" -s


echo "Done."

# open links for extenstions
nohup firefox "https://addons.mozilla.org/en-US/firefox/addon/matte-black-v1/" "https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/" "https://addons.mozilla.org/en-US/firefox/addon/darkreader/" "https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/" "https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/" >/dev/null 2>&1 &
