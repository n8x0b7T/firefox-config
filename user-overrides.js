

// enable scrolling with middle mouse click
user_pref("general.autoScroll", true);


// disable search suggestions
user_pref("browser.search.update", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);


user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.downloads", false);

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

// dark mode for built-in pdf reader
user_pref("pdfjs.viewerCssTheme", 2);

// disable letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);