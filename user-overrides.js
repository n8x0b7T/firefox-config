
// disable ff sync
user_pref("identity.fxaccounts.enabled", false);

user_pref("browser.shell.checkDefaultBrowser", false);

// disable safe browsing
defaultPref("browser.safebrowsing.malware.enabled", false);
defaultPref("browser.safebrowsing.phishing.enabled", false);
defaultPref("browser.safebrowsing.blockedURIs.enabled", false);
defaultPref("browser.safebrowsing.provider.google4.gethashURL", "");
defaultPref("browser.safebrowsing.provider.google4.updateURL", "");
defaultPref("browser.safebrowsing.provider.google.gethashURL", "");
defaultPref("browser.safebrowsing.provider.google.updateURL", "");
defaultPref("browser.safebrowsing.downloads.enabled", false);
pref("browser.safebrowsing.downloads.remote.enabled", false);
pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
pref("browser.safebrowsing.downloads.remote.url", "");
pref("browser.safebrowsing.provider.google4.dataSharingURL", "");



// enable scrolling with middle mouse click
user_pref("general.autoScroll", true);


defaultPref("browser.startup.homepage_override.mstone", "ignore");
defaultPref("startup.homepage_override_url", "about:blank");
defaultPref("startup.homepage_welcome_url", "about:blank");
defaultPref("startup.homepage_welcome_url.additional", "");
lockPref("browser.messaging-system.whatsNewPanel.enabled", false);
lockPref("browser.uitour.enabled", false);
lockPref("browser.uitour.url", "");
defaultPref("browser.shell.checkDefaultBrowser", false);

// disable search suggestions
user_pref("browser.search.update", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);

// disable save password prompt
defaultPref("signon.rememberSignons", false);
defaultPref("signon.autofillForms", false);
defaultPref("extensions.formautofill.addresses.enabled", false);
defaultPref("extensions.formautofill.creditCards.enabled", false);
defaultPref("signon.formlessCapture.enabled", false);
