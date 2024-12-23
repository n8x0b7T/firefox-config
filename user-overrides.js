
// enable scrolling with middle mouse click
user_pref("general.autoScroll", true);


// disable search suggestions
user_pref("browser.search.update", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);


user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false);

// search from the URL bar, but no search suggestions
user_pref("keyword.enabled", true);
user_pref("browser.search.update", false);


// disable firefox view
user_pref("browser.tabs.firefox-view", false);

// fix newtab page
user_pref("browser.startup.blankWindow", false);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.startup.page", 1);
user_pref("browser.newtabpage.enabled", true);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// dark mode for built-in pdf reader
user_pref("pdfjs.viewerCssTheme", 2);

// fingerprint config
user_pref("privacy.resistFingerprinting.letterboxing", false);
user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-JSDateTimeUTC,-CSSPrefersColorScheme");

// no webgl
user_pref("webgl.disabled", true);

// allow extensions to work on mozilla websites
user_pref("extensions.webextensions.restrictedDomains", "");

// dont sent x-origin referers
user_pref("network.http.referer.XOriginPolicy", 2);
