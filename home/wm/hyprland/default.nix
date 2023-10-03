{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      # Examples of adding plugins:
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # "/absolute/path/to/plugin.so"
    ];
  };

  # config files 
  home.file.".config/hyprland/" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}
