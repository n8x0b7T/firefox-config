# Firefox Config

## Instalation
- Install firefox
- Remove profiles if they already exist
```
rm -r ~/.mozilla
```
- Launch Firefox once, then close it
```
curl https://raw.githubusercontent.com/n8x0b7T/user-overrides.js/main/bootstrap.sh | sudo bash -s ~/.mozilla/firefox/*.default-release
```
- Make sure to set default search engine
- Also update uBlock's lists