if [ ! -f "/usr/bin/firefox" ]; then
    echo "Please install firefox"
    exit
fi

if [ ! -f "/usr/lib/firefox/" ]; then
    echo "Can not find firefox directory"
    exit
fi

mkdir -p /usr/lib/firefox/defaults/pref
wget -O -P /usr/lib/firefox/defaults/pref "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/autoconfig.js" 

wget -O -P /usr/lib/firefox/ "https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/mozilla.cfg" 
ls /usr/lib/firefox/