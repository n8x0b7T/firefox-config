if [ ! -f "/usr/bin/firefox" ]; then
    echo "Please install firefox"
    exit
fi

if [ ! -d "/usr/lib/firefox" ]; then
    echo "Can not find firefox directory"
    exit
fi

if [ -z "$1" ] || [ ! -d "$1" ]; then
    echo "Please suply a valid firefox profile directory as the first positional argument"
    exit
fi



exit

mkdir -p /usr/lib/firefox/defaults/pref
curl "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/autoconfig.js" > /usr/lib/firefox/defaults/pref/autoconfig.js
curl "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/firefox.cfg" > /usr/lib/firefox/firefox.cfg
curl "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/policies.json" > /usr/lib/firefox/distribution/policies.json



