{
  pkgs,
  config,
  ...
}: {

    programs.firefox = {
        enable = true;
        profiles = {
            bonesaw = {
                id = 0;
                name = "bonesaw";
                search = {
                    default = "Google";
                    force = true;
                    order = [
                        "Google"
                        "DuckDuckGo"
                    ];
                };

                # All firefox settings from about:config can be enabled here
                # Home-manager will convert all JSON-compatible values into strings
                settings = {
                    "browser.startup.homepage" = "https://google.com";
                    "browser.search.region" = "DE";
                };

                bookmarks = [
                    {
                        name = "Youtube";
                        url = "https://www.youtube.com";
                    }
                    {
                        name = "Twitch";
                        url = "https://www.twitch.tv";
                    }
                    {
                        name = "Reddit";
                        url = "https://www.reddit.com";
                    }
                    {
                        name = "Github";
                        url = "https://www.github.com";
                    }
                ];

                extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                    #=================== Utility ==============================
                    bitwarden
                    ublock-origin
                    vimium
                    no-pdf-download

                    #=================== Social Media =========================
                    # Twitch
                    betterttv

                    # Youtube
                    return-youtube-dislikes
                    sponsorblock
                    youtube-shorts-block
                    enhancer-for-youtube

                    # Reddit
                    old-reddit-redirect
                    reddit-enhancement-suite

                    # Twitter
                    nitter-redirect
                    
                    # Steam
                    protondb-for-steam
                    augmented-steam

                    #=================== Privacy ==============================
                    # Cookies
                    cookie-autodelete
                    consent-o-matic
                    i-dont-care-about-cookies

                    # Privacy
                    decentraleyes
                    privacy-badger

                ];
            };
        };
    };
}