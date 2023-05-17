

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

// search from the URL bar, but no search suggestions
user_pref("keyword.enabled", true);
user_pref("browser.search.update", false);


// disable firefox view
user_pref("browser.tabs.firefox-view", false);

user_pref("browser.startup.blankWindow", false);

user_pref("browser.startup.homepage", "about:home");
/* 0104: set NEWTAB page
 * true=Firefox Home (default, see 0105), false=blank page
 * [SETTING] Home>New Windows and Tabs>New tabs ***/
// user_pref("browser.newtabpage.enabled", true);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

