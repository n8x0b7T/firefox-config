

// enable scrolling with middle mouse click
user_pref("general.autoScroll", true);


// disable search suggestions
user_pref("browser.search.update", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);



// load in cfg file for locking prefs
pref("general.config.filename", "mozilla.cfg");
lockPref("general.config.obscure_value", 0);

user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.downloads", false);

// search from the URL bar
user_pref("keyword.enabled", true);