# Firefox Config



## Instalation
*WARNING: this will erase all exising Firefox data*
- Install firefox
```
curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/bootstrap.sh" | bash
```
- Firefox will open once to generate a baseline profile. Close it once the extensions are done installing.
- Make sure to set default search engine
- Set apropriate settings in CanvasBlocker

## Update
This mode will not configure extensions or remove the existing Firefox profile
```
curl -s "https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/bootstrap.sh" | bash -s -- -u
```
## Gesture Support for GNOME on Wayland
*Not needed for newer Firefox versions*
```
sudo curl -s https://raw.githubusercontent.com/n8x0b7T/firefox-config/main/firefox.desktop > /usr/share/applications/firefox.desktop
```
