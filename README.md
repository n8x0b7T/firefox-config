# Firefox Config

*WARNING: this repo will erase all exising Firefox data*

## Instalation
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