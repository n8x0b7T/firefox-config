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

if [ -z "$1" ] || [ ! -f "$1/prefs.js" ]; then
    echo "Please suply a valid firefox profile directory as the first positional argument"
    exit
fi

killall firefox 

echo -e " \n\n\nChanging user profile"
curl -s "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/user-overrides.js" > "$1/user-overrides.js"
curl -s "https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh" | bash -s -- -p "$1" -s

echo "Changing global configs"
"$sudo" mkdir -p /usr/lib/firefox/defaults/pref
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/autoconfig.js" > /usr/lib/firefox/defaults/pref/autoconfig.js'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/firefox.cfg" > /usr/lib/firefox/firefox.cfg'
"$sudo" bash -c 'curl -s "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/policies.json" > /usr/lib/firefox/distribution/policies.json'

echo "Done."

