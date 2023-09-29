{
  pkgs,
  config,
  ...
}: {

    programs.wezterm = {
        enable = true;
        enableZshIntegration = true;
    };

    # config files 
    home.file.".config/wezterm" = {
        source = ./config;
        recursive = true;
    };
}
